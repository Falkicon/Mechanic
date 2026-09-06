import sqlite3
from contextlib import closing
import json
from pathlib import Path
from datetime import datetime
from typing import Optional, List, Dict, Any


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
                if "tests" in data:
                    for test in data["tests"]:
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

                if "perf" in data:
                    perf = data["perf"]
                    cursor.execute(
                        "INSERT INTO perf_metrics (reload_id, addon, memory_kb, load_time_ms) VALUES (?, ?, ?, ?)",
                        (reload_id, addon, perf.get("memory"), perf.get("load_time")),
                    )
            return reload_id

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
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO command_results (command, addon, timestamp, success, result_json) VALUES (?, ?, ?, ?, ?)",
                (
                    command,
                    addon,
                    datetime.now().isoformat(),
                    result.get("success", False),
                    json.dumps(result),
                ),
            )
            return cursor.lastrowid

    def get_command_history(
        self, command: Optional[str] = None, limit: int = 50
    ) -> List[Dict[str, Any]]:
        """Get command execution history, optionally filtered by command name."""
        with closing(sqlite3.connect(self.db_path)) as conn, conn:
            conn.row_factory = sqlite3.Row

            if command:
                rows = conn.execute(
                    "SELECT * FROM command_results WHERE command = ? ORDER BY id DESC LIMIT ?",
                    (command, limit),
                ).fetchall()
            else:
                rows = conn.execute(
                    "SELECT * FROM command_results ORDER BY id DESC LIMIT ?", (limit,)
                ).fetchall()

            results = []
            for row in rows:
                entry = dict(row)
                if entry.get("result_json"):
                    try:
                        entry["result"] = json.loads(entry["result_json"])
                        del entry["result_json"]
                    except Exception:
                        entry["result"] = None
                results.append(entry)

            # Reverse so oldest is first (for history navigation)
            return list(reversed(results))

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
