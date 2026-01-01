import sqlite3
import json
from pathlib import Path
from datetime import datetime
from typing import Optional, List, Dict, Any

class Storage:
    def __init__(self, db_path: Path):
        self.db_path = db_path
        self._init_db()

    def _init_db(self):
        with sqlite3.connect(self.db_path) as conn:
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

    def save_reload(self, timestamp: float, addons_data: dict, session_id: str = "default"):
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO reload_history (timestamp, session_id, addons_data) VALUES (?, ?, ?)",
                (timestamp, session_id, json.dumps(addons_data))
            )
            reload_id = cursor.lastrowid
            
            # Extract tests and perf from data if available
            for addon, data in addons_data.items():
                if "tests" in data:
                    for test in data["tests"]:
                        cursor.execute(
                            "INSERT INTO test_results (reload_id, addon, test_name, passed, duration_ms, error_message) VALUES (?, ?, ?, ?, ?, ?)",
                            (reload_id, addon, test.get("name"), test.get("passed"), test.get("duration"), test.get("error"))
                        )
                
                if "perf" in data:
                    perf = data["perf"]
                    cursor.execute(
                        "INSERT INTO perf_metrics (reload_id, addon, memory_kb, load_time_ms) VALUES (?, ?, ?, ?)",
                        (reload_id, addon, perf.get("memory"), perf.get("load_time"))
                    )
            return reload_id

    def get_latest_metrics(self):
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            row = conn.execute("SELECT * FROM reload_history ORDER BY id DESC LIMIT 1").fetchone()
            if row:
                res = dict(row)
                if res.get("addons_data"):
                    try:
                        res["addons_data"] = json.loads(res["addons_data"])
                    except Exception:
                        pass
                return res
            return None

    # ═══════════════════════════════════════════════════════════════════════════
    # COMMAND HISTORY
    # ═══════════════════════════════════════════════════════════════════════════

    def save_command_result(self, command: str, result: Dict[str, Any], addon: Optional[str] = None) -> int:
        """Save a command execution result to the database."""
        with sqlite3.connect(self.db_path) as conn:
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO command_results (command, addon, timestamp, success, result_json) VALUES (?, ?, ?, ?, ?)",
                (
                    command,
                    addon,
                    datetime.now().isoformat(),
                    result.get("success", False),
                    json.dumps(result)
                )
            )
            return cursor.lastrowid

    def get_command_history(self, command: Optional[str] = None, limit: int = 50) -> List[Dict[str, Any]]:
        """Get command execution history, optionally filtered by command name."""
        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = sqlite3.Row
            
            if command:
                rows = conn.execute(
                    "SELECT * FROM command_results WHERE command = ? ORDER BY id DESC LIMIT ?",
                    (command, limit)
                ).fetchall()
            else:
                rows = conn.execute(
                    "SELECT * FROM command_results ORDER BY id DESC LIMIT ?",
                    (limit,)
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
        with sqlite3.connect(self.db_path) as conn:
            if command:
                cursor = conn.execute("DELETE FROM command_results WHERE command = ?", (command,))
            else:
                cursor = conn.execute("DELETE FROM command_results")
            return cursor.rowcount

