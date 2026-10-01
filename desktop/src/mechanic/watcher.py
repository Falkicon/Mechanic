import asyncio
import sys
import time
from pathlib import Path

from watchfiles import awatch

from .parsers import is_parse_error
from .server import notify_reload

# Addon SavedVariables other than !Mechanic are only worth parsing when they can
# carry diagnostics; a byte search is far cheaper than parsing every file WoW
# rewrites on /reload.
_DIAGNOSTIC_MARKERS = (b"tests", b"testResults", b"healthLog", b"consoleBuffer")
_PRIMARY_STEM = "!Mechanic"


def _log(message: str) -> None:
    """Print without ever raising on consoles that cannot encode the text."""
    try:
        print(message, flush=True)
    except UnicodeError:
        encoding = getattr(sys.stdout, "encoding", None) or "ascii"
        print(message.encode(encoding, "replace").decode(encoding), flush=True)


def _may_carry_diagnostics(path: Path) -> bool:
    """Cheap pre-filter run off the event loop; errors mean "look anyway"."""
    if path.stem == _PRIMARY_STEM:
        return True
    try:
        data = path.read_bytes()
    except OSError:
        return False
    return any(marker in data for marker in _DIAGNOSTIC_MARKERS)


class SVWatcher:
    def __init__(
        self,
        watch_paths: list[Path],
        src_paths: list[Path] = None,
        auto_reload: bool = False,
        reload_key: str = "^+r",
        target: dict | None = None,
    ):
        # Keep original for diagnostics
        self.raw_watch = watch_paths
        self.raw_src = src_paths or []

        # Filter valid
        self.watch_paths = [p for p in watch_paths if p.exists()]
        self.src_paths = [p for p in (src_paths or []) if p.exists()]

        self.target = target
        self.auto_reload = auto_reload
        self.reload_key = reload_key
        self.running = False
        self.last_parsed = {}
        self._stop_event = None

    async def start(self, stop_event: asyncio.Event = None):
        self.running = True
        self._stop_event = stop_event if stop_event is not None else asyncio.Event()

        # Diagnostics for the user
        invalid = [str(p) for p in self.raw_watch + self.raw_src if not p.exists()]
        if invalid:
            _log("Warning: The following paths do not exist and will be ignored:")
            for p in invalid:
                _log(f"  - {p}")
            if any("..." in p for p in invalid):
                _log(
                    "  Tip: It looks like you used '...' placeholders. Please use your REAL absolute paths!"
                )

        # Combine all paths to watch
        all_watch_paths = self.watch_paths + self.src_paths
        if not all_watch_paths:
            _log("Error: No valid paths to watch. The watcher cannot start.")
            self.running = False
            return

        _log(
            f"Watcher started on {len(self.watch_paths)} SV paths and {len(self.src_paths)} src paths..."
        )
        for p in self.watch_paths:
            _log(f"   Watching SV: {p}")

        try:
            async for changes in awatch(*all_watch_paths, stop_event=self._stop_event):
                if not self.running:
                    break

                _log(f"Watcher detected {len(changes)} file change(s)")

                # WoW finishes writing SavedVariables shortly after the change fires
                delay_done = False

                for change, file_path in changes:
                    _log(f"   -> {change}: {file_path}")
                    file_path_obj = Path(file_path)

                    # Case 1: Source code change (Hot Reload)
                    is_src_change = any(
                        file_path_obj.is_relative_to(src_p) for src_p in self.src_paths
                    )
                    if is_src_change and file_path.endswith(".lua"):
                        if self.auto_reload:
                            from .utils import trigger_wow_reload

                            _log(
                                f"Source change detected: {file_path_obj.name}. Triggering reload..."
                            )
                            # Window focus + SendKeys blocks; keep the loop responsive.
                            await asyncio.to_thread(trigger_wow_reload, self.reload_key)
                        continue

                    # Case 2: SavedVariables change (Broadcast to UI)
                    if file_path.endswith(".lua"):
                        # Ignore Blizzard internal variables immediately
                        if file_path_obj.stem.startswith("Blizzard_"):
                            continue

                        if not delay_done:
                            await asyncio.sleep(0.1)
                            delay_done = True

                        try:
                            if not await asyncio.to_thread(
                                _may_carry_diagnostics, file_path_obj
                            ):
                                continue

                            from .commands.core import get_server

                            server = get_server()

                            result = await server.execute(
                                "sv.parse",
                                {
                                    "file_path": str(file_path_obj),
                                    "target": self.target,
                                },
                            )

                            if (
                                not result.success
                                and result.error
                                and result.error.code == "TARGET_AMBIGUOUS"
                                and file_path_obj.stem == _PRIMARY_STEM
                            ):
                                # The browser owns its target selection. Invalidate
                                # without publishing one arbitrary profile's data.
                                await notify_reload(
                                    {
                                        "addon": _PRIMARY_STEM,
                                        "timestamp": time.time(),
                                        "target": None,
                                        "candidates": result.error.details.get(
                                            "candidates", []
                                        ),
                                    }
                                )

                            if (
                                not result.success
                                and result.error
                                and result.error.code == "PARSE_ERROR"
                            ):
                                _log(
                                    f"Skipped {file_path_obj.name}: {result.error.message}"
                                )

                            if result.success and result.data:
                                var_name = file_path_obj.stem
                                addon_data = result.data.addons.get(var_name)

                                if is_parse_error(addon_data) or not isinstance(
                                    addon_data, dict
                                ):
                                    _log(
                                        f"Skipped {file_path_obj.name}: no addon_data found for {var_name}"
                                    )
                                elif addon_data:
                                    # Check for actionable data (Tests, Health Log, Console Buffer)
                                    # or if it's explicitly the !Mechanic addon
                                    has_tests = bool(addon_data.get("tests"))
                                    has_logs = bool(addon_data.get("healthLog"))
                                    has_console = bool(addon_data.get("consoleBuffer"))
                                    is_mechanic = var_name == _PRIMARY_STEM

                                    if (
                                        has_tests
                                        or has_logs
                                        or has_console
                                        or is_mechanic
                                    ):
                                        _log(
                                            f"Actionable update in {var_name} (tests={has_tests}, logs={has_logs}, console={has_console})"
                                        )
                                        await notify_reload(
                                            {
                                                "addon": var_name,
                                                "timestamp": time.time(),
                                                "data": addon_data,
                                                "target": result.data.target.model_dump()
                                                if result.data.target
                                                else None,
                                            }
                                        )
                                    else:
                                        _log(f"Skipped {var_name}: no actionable data")
                                else:
                                    _log(
                                        f"Skipped {file_path_obj.name}: no addon_data found for {var_name}"
                                    )
                        except Exception as e:
                            _log(f"Error triggering AFD parse for {file_path}: {e}")
        except Exception as e:
            if self.running:  # Only print if we didn't expect to stop
                _log(f"Watcher loop error: {e}")
        finally:
            self.running = False

    def stop(self):
        self.running = False
        if self._stop_event is not None:
            self._stop_event.set()
