import asyncio
from watchfiles import awatch, watch
from pathlib import Path
from .server import notify_reload
from .parsers import parse_savedvariables
import os
import time

class SVWatcher:
    def __init__(self, watch_paths: list[Path], src_paths: list[Path] = None, auto_reload: bool = False, reload_key: str = "^+r"):
        # Keep original for diagnostics
        self.raw_watch = watch_paths
        self.raw_src = src_paths or []
        
        # Filter valid
        self.watch_paths = [p for p in watch_paths if p.exists()]
        self.src_paths = [p for p in (src_paths or []) if p.exists()]
        
        self.auto_reload = auto_reload
        self.reload_key = reload_key
        self.running = False
        self.last_parsed = {}

    async def start(self, stop_event: asyncio.Event = None):
        self.running = True
        
        # Diagnostics for the user
        invalid = [str(p) for p in self.raw_watch + self.raw_src if not p.exists()]
        if invalid:
            print("⚠️ Warning: The following paths do not exist and will be ignored:")
            for p in invalid:
                print(f"  - {p}")
            if any("..." in p for p in invalid):
                print("  💡 Tip: It looks like you used '...' placeholders. Please use your REAL absolute paths!")

        # Combine all paths to watch
        all_watch_paths = self.watch_paths + self.src_paths
        if not all_watch_paths:
            print("❌ Error: No valid paths to watch. The watcher cannot start.")
            return

        print(f"Watcher started on {len(self.watch_paths)} SV paths and {len(self.src_paths)} src paths...")
        for p in self.watch_paths:
            print(f"   📂 Watching SV: {p}")
        
        try:
            async for changes in awatch(*all_watch_paths, stop_event=stop_event): 
                if not self.running:
                    break
                
                # Debug: Log all detected changes
                print(f"🔍 Watcher detected {len(changes)} file change(s)")
                
                for change, file_path in changes:
                    print(f"   -> {change}: {file_path}")
                    file_path_obj = Path(file_path)
                    
                    # Case 1: Source code change (Hot Reload)
                    is_src_change = any(file_path_obj.is_relative_to(src_p) for src_p in self.src_paths)
                    if is_src_change and file_path.endswith(".lua"):
                        if self.auto_reload:
                            from .utils import trigger_wow_reload
                            print(f"Source change detected: {file_path_obj.name}. Triggering reload...")
                            trigger_wow_reload(self.reload_key)
                        continue

                    # Case 2: SavedVariables change (Broadcast to UI)
                    if file_path.endswith(".lua"):
                        # Ignore Blizzard internal variables immediately
                        if file_path_obj.stem.startswith("Blizzard_"):
                            continue
                        
                        # Small delay to ensure file is finished writing
                        await asyncio.sleep(0.1)
                        
                        try:
                            from .commands.core import get_server
                            server = get_server()
                            
                            result = await server.execute("sv.parse", {"file_path": str(file_path_obj)})
                            
                            if result.success and result.data:
                                var_name = file_path_obj.stem
                                addon_data = result.data.addons.get(var_name)
                                
                                if addon_data:
                                    # Check for actionable data (Tests, Health Log, Console Buffer)
                                    # or if it's explicitly the !Mechanic addon
                                    has_tests = "tests" in addon_data and addon_data["tests"]
                                    has_logs = "healthLog" in addon_data and addon_data["healthLog"]
                                    has_console = "consoleBuffer" in addon_data and addon_data["consoleBuffer"]
                                    is_mechanic = var_name == "!Mechanic"

                                    if has_tests or has_logs or has_console or is_mechanic:
                                        print(f"📡 Actionable update in {var_name} (tests={bool(has_tests)}, logs={bool(has_logs)}, console={bool(has_console)})")
                                        await notify_reload({
                                            "addon": var_name,
                                            "timestamp": time.time(),
                                            "data": addon_data
                                        })
                                    else:
                                        print(f"⏭️ Skipped {var_name}: no actionable data")
                                else:
                                    print(f"⏭️ Skipped {file_path_obj.name}: no addon_data found for {var_name}")
                        except Exception as e:
                            print(f"Error triggering AFD parse for {file_path}: {e}")
        except Exception as e:
            if self.running:  # Only print if we didn't expect to stop
                print(f"Watcher loop error: {e}")

    def stop(self):
        self.running = False
