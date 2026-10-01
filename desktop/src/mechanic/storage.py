import sqlite3
from contextlib import closing
import json
from pathlib import Path
from datetime import datetime
from typing import Optional, List, Dict, Any


# Retention caps keep the history database bounded for long-running dashboards.
MAX_COMMAND_ROWS = 1000
MAX_RELOAD_ROWS = 200
# A single stored command result larger than this is replaced by a stub.
MAX_RESULT_BYTES = 1_000_000


class Storage:
    def __init__(self, db_path: Path):
        self.db_path = db_path
        self._init_db()

    def _init_db(self):
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            conn.execute("""
                CREATE TABLE IF NOT EXISTS reload_history (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    timestamp REAL,
                    session_id TEXT,
                    addons_data TEXT
                )
            """)
            conn.execute("""
                CREATE TABLE IF NOT EXISTS test_results (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    reload_id INTEGER,
                    addon TEXT,
                    test_name TEXT,
                    passed BOOLEAN,
                    duration_ms REAL,
                    error_message TEXT,
                    FOREIGN KEY(reload_id) REFERENCES reload_history(id)
                )
            """)
            conn.execute("""
                CREATE TABLE IF NOT EXISTS perf_metrics (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    reload_id INTEGER,
                    addon TEXT,
                    memory_kb REAL,
                    load_time_ms REAL,
                    FOREIGN KEY(reload_id) REFERENCES reload_history(id)
                )
            """)
            # Command history table
            conn.execute("""
                CREATE TABLE IF NOT EXISTS command_results (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    command TEXT NOT NULL,
                    addon TEXT,
                    timestamp TEXT NOT NULL,
                    success BOOLEAN,
                    result_json TEXT
                )
            """)
            # Index for faster queries by command
            conn.execute("""
                CREATE INDEX IF NOT EXISTS idx_command_results_command 
                ON command_results(command)
            """)

    @staticmethod
    def read_stats(db_path: Path) -> dict:
        """Inspect existing history using SQLite read-only mode; never initialize it."""
        db_path = Path(db_path)
        if not db_path.is_file():
            return {
                "available": False,
                "reason": "History database does not exist",
                "file_bytes": 0,
                "rows": {},
            }
        tables = ("reload_history", "test_results", "perf_metrics", "command_results")
        try:
            with closing(
                sqlite3.connect(db_path.resolve().as_uri() + "?mode=ro", uri=True)
            ) as conn:
                rows = {
                    name: conn.execute(f"SELECT COUNT(*) FROM {name}").fetchone()[0]
                    for name in tables
                }
            return {
                "available": True,
                "file_bytes": db_path.stat().st_size,
                "rows": rows,
            }
        except (OSError, sqlite3.Error) as exc:
            return {
                "available": False,
                "reason": f"History statistics unavailable: {exc}",
                "file_bytes": 0,
                "rows": {},
            }

    def get_stats(self) -> dict:
        return self.read_stats(self.db_path)

    def save_reload(
        self, timestamp: float, addons_data: dict, session_id: str = "default"
    ):
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO reload_history (timestamp, session_id, addons_data) VALUES (?, ?, ?)",
                (timestamp, session_id, json.dumps(addons_data)),
            )
            reload_id = cursor.lastrowid

            # Extract tests and perf from data if available
            for addon, data in addons_data.items():
                if not isinstance(data, dict):
                    continue
                tests = data.get("tests")
                if isinstance(tests, list):
                    for test in tests:
                        if not isinstance(test, dict):
                            continue
                        cursor.execute(
                            "INSERT INTO test_results (reload_id, addon, test_name, passed, duration_ms, error_message) VALUES (?, ?, ?, ?, ?, ?)",
                            (
                                reload_id,
                                addon,
                                test.get("name"),
                                test.get("passed"),
                                test.get("duration"),
                                test.get("error"),
                            ),
                        )

                perf = data.get("perf")
                if isinstance(perf, dict):
                    cursor.execute(
                        "INSERT INTO perf_metrics (reload_id, addon, memory_kb, load_time_ms) VALUES (?, ?, ?, ?)",
                        (reload_id, addon, perf.get("memory"), perf.get("load_time")),
                    )
            self._prune_reloads(cursor)
            return reload_id

    @staticmethod
    def _prune_reloads(cursor) -> None:
        """Drop reload rows (and their child rows) beyond MAX_RELOAD_ROWS."""
        cutoff = cursor.execute(
            "SELECT id FROM reload_history ORDER BY id DESC LIMIT 1 OFFSET ?",
            (MAX_RELOAD_ROWS,),
        ).fetchone()
        if cutoff is None:
            return
        for table in ("test_results", "perf_metrics"):
            cursor.execute(f"DELETE FROM {table} WHERE reload_id <= ?", (cutoff[0],))
        cursor.execute("DELETE FROM reload_history WHERE id <= ?", (cutoff[0],))

    @staticmethod
    def read_latest_metrics(db_path: Path):
        """Read existing history without creating its directory, database or schema."""
        db_path = Path(db_path)
        if not db_path.is_file():
            return None
        with closing(
            sqlite3.connect(db_path.resolve().as_uri() + "?mode=ro", uri=True)
        ) as conn:
            conn.row_factory = sqlite3.Row
            row = conn.execute(
                "SELECT * FROM reload_history ORDER BY id DESC LIMIT 1"
            ).fetchone()
            if row:
                result = dict(row)
                if result.get("addons_data"):
                    try:
                        result["addons_data"] = json.loads(result["addons_data"])
                    except (ValueError, TypeError):
                        pass
                return result
        return None

    def get_latest_metrics(self):
        return self.read_latest_metrics(self.db_path)

    # ═══════════════════════════════════════════════════════════════════════════
    # COMMAND HISTORY
    # ═══════════════════════════════════════════════════════════════════════════

    def save_command_result(
        self, command: str, result: Dict[str, Any], addon: Optional[str] = None
    ) -> int:
        """Save a command execution result to the database."""
        payload = json.dumps(result, default=str)
        if len(payload) > MAX_RESULT_BYTES:
            payload = json.dumps(
                {
                    "success": result.get("success", False),
                    "error": result.get("error"),
                    "data": None,
                    "truncated": True,
                    "original_bytes": len(payload),
                },
                default=str,
            )
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO command_results (command, addon, timestamp, success, result_json) VALUES (?, ?, ?, ?, ?)",
                (
                    command,
                    addon,
                    datetime.now().isoformat(),
                    result.get("success", False),
                    payload,
                ),
            )
            row_id = cursor.lastrowid
            cursor.execute(
                "DELETE FROM command_results WHERE id <= "
                "(SELECT id FROM command_results ORDER BY id DESC LIMIT 1 OFFSET ?)",
                (MAX_COMMAND_ROWS,),
            )
            return row_id

    def get_command_history(
        self,
        command: Optional[str] = None,
        limit: int = 50,
        max_result_bytes: Optional[int] = None,
    ) -> List[Dict[str, Any]]:
        """Get command execution history, optionally filtered by command name.

        With ``max_result_bytes`` set, results larger than that are not loaded:
        the entry carries ``result: None``, ``result_truncated: True`` and
        ``result_bytes`` instead; fetch one in full with ``get_command_result``.
        """
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            conn.row_factory = sqlite3.Row

            columns = "id, command, addon, timestamp, success, length(result_json) AS result_bytes"
            params: list = []
            if max_result_bytes is None:
                columns += ", result_json"
            else:
                columns += ", CASE WHEN length(result_json) <= ? THEN result_json END AS result_json"
                params.append(max_result_bytes)
            query = f"SELECT {columns} FROM command_results"
            if command:
                query += " WHERE command = ?"
                params.append(command)
            query += " ORDER BY id DESC LIMIT ?"
            params.append(limit)
            rows = conn.execute(query, params).fetchall()

            results = []
            for row in rows:
                entry = dict(row)
                raw = entry.pop("result_json", None)
                if raw is not None:
                    try:
                        entry["result"] = json.loads(raw)
                    except ValueError:
                        entry["result"] = None
                else:
                    entry["result"] = None
                    if max_result_bytes is not None and entry["result_bytes"]:
                        entry["result_truncated"] = True
                results.append(entry)

            # Reverse so oldest is first (for history navigation)
            return list(reversed(results))

    def get_command_result(self, result_id: int) -> Optional[Dict[str, Any]]:
        """Return one stored command result in full, or None when it is gone."""
        with closing(sqlite3.connect(self.db_path)) as conn:
            conn.row_factory = sqlite3.Row
            row = conn.execute(
                "SELECT id, command, addon, timestamp, success, result_json "
                "FROM command_results WHERE id = ?",
                (result_id,),
            ).fetchone()
        if row is None:
            return None
        entry = dict(row)
        try:
            entry["result"] = json.loads(entry.pop("result_json") or "null")
        except ValueError:
            entry["result"] = None
        return entry

    def clear_command_history(self, command: Optional[str] = None) -> int:
        """Clear command history, optionally for a specific command only."""
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            if command:
                cursor = conn.execute(
                    "DELETE FROM command_results WHERE command = ?", (command,)
                )
            else:
                cursor = conn.execute("DELETE FROM command_results")
            return cursor.rowcount
