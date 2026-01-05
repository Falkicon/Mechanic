"""
Performance profiling commands for WoW addon development.
Tracks performance baselines and detects regressions.

Migrated from ADDON_DEV/Tools/PerformanceProfiler to AFD commands.
"""

import json
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_config


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════

class PerfBaselineInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")
    version: str = Field(..., description="Version being measured")
    memory_kb: float = Field(..., description="Memory usage in KB")
    cpu_ms: float = Field(..., description="CPU time in milliseconds")


class PerfBaselineOutput(BaseModel):
    addon: str
    version: str
    memory_kb: float
    cpu_ms: float
    timestamp: str
    history_count: int


class PerfCompareInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")
    memory_kb: float = Field(..., description="Current memory usage in KB")
    cpu_ms: float = Field(..., description="Current CPU time in milliseconds")
    memory_threshold: float = Field(default=1.5, description="Memory increase factor that triggers warning")
    cpu_threshold: float = Field(default=2.0, description="CPU increase factor that triggers warning")


class PerfCompareOutput(BaseModel):
    addon: str
    has_regression: bool
    memory_regression: bool
    cpu_regression: bool
    memory_ratio: Optional[float] = None
    cpu_ratio: Optional[float] = None
    previous: Optional[Dict[str, Any]] = None
    current: Dict[str, float]
    message: str


class PerfReportInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")
    limit: int = Field(default=10, description="Number of recent measurements to show")


class PerfReportOutput(BaseModel):
    addon: str
    history: List[Dict[str, Any]]
    trend: Optional[Dict[str, float]] = None
    report: str


class PerfListInput(BaseModel):
    pass  # No input required


class PerfListOutput(BaseModel):
    addons: List[str]
    count: int


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def _get_baselines_dir() -> Path:
    """Get the directory for storing performance baselines."""
    config = get_config()
    baselines_dir = config.data_dir / "perf_baselines"
    baselines_dir.mkdir(parents=True, exist_ok=True)
    return baselines_dir


def _get_baseline_path(addon_name: str) -> Path:
    """Get the path to an addon's baseline file."""
    return _get_baselines_dir() / f"{addon_name}_baseline.json"


def _load_baseline(addon_name: str) -> Dict[str, Any]:
    """Load existing baseline for an addon."""
    path = _get_baseline_path(addon_name)
    if path.exists():
        try:
            return json.loads(path.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, IOError):
            return {"history": [], "thresholds": {}}
    return {"history": [], "thresholds": {}}


def _save_baseline(addon_name: str, data: Dict[str, Any]):
    """Save baseline data."""
    path = _get_baseline_path(addon_name)
    path.write_text(json.dumps(data, indent=2), encoding="utf-8")


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════

async def _perf_baseline(input: PerfBaselineInput, context: Any = None) -> CommandResult[PerfBaselineOutput]:
    """
    Record a performance baseline measurement for an addon.
    """
    baseline = _load_baseline(input.addon)

    measurement = {
        "version": input.version,
        "timestamp": datetime.now().isoformat(),
        "memory_kb": input.memory_kb,
        "cpu_ms": input.cpu_ms,
    }

    baseline["history"].append(measurement)

    # Keep last 50 measurements
    if len(baseline["history"]) > 50:
        baseline["history"] = baseline["history"][-50:]

    _save_baseline(input.addon, baseline)

    return success(
        data=PerfBaselineOutput(
            addon=input.addon,
            version=input.version,
            memory_kb=input.memory_kb,
            cpu_ms=input.cpu_ms,
            timestamp=measurement["timestamp"],
            history_count=len(baseline["history"])
        ),
        reasoning=f"Recorded baseline for {input.addon} v{input.version}"
    )


async def _perf_compare(input: PerfCompareInput, context: Any = None) -> CommandResult[PerfCompareOutput]:
    """
    Compare current performance metrics against the baseline and detect regressions.
    """
    baseline = _load_baseline(input.addon)

    if not baseline["history"]:
        return success(
            data=PerfCompareOutput(
                addon=input.addon,
                has_regression=False,
                memory_regression=False,
                cpu_regression=False,
                current={"memory_kb": input.memory_kb, "cpu_ms": input.cpu_ms},
                message="No baseline to compare against"
            ),
            reasoning="No previous measurements found for comparison"
        )

    latest = baseline["history"][-1]
    memory_ratio = None
    cpu_ratio = None
    memory_regression = False
    cpu_regression = False

    # Check memory
    if latest["memory_kb"] > 0:
        memory_ratio = round(input.memory_kb / latest["memory_kb"], 2)
        if memory_ratio > input.memory_threshold:
            memory_regression = True

    # Check CPU
    if latest["cpu_ms"] > 0:
        cpu_ratio = round(input.cpu_ms / latest["cpu_ms"], 2)
        if cpu_ratio > input.cpu_threshold:
            cpu_regression = True

    has_regression = memory_regression or cpu_regression

    # Build message
    if has_regression:
        parts = []
        if memory_regression:
            parts.append(f"memory increased {memory_ratio}x")
        if cpu_regression:
            parts.append(f"CPU increased {cpu_ratio}x")
        message = f"REGRESSION DETECTED: {', '.join(parts)}"
    else:
        message = "Performance is within acceptable thresholds"

    return success(
        data=PerfCompareOutput(
            addon=input.addon,
            has_regression=has_regression,
            memory_regression=memory_regression,
            cpu_regression=cpu_regression,
            memory_ratio=memory_ratio,
            cpu_ratio=cpu_ratio,
            previous=latest,
            current={"memory_kb": input.memory_kb, "cpu_ms": input.cpu_ms},
            message=message
        ),
        reasoning=message
    )


async def _perf_report(input: PerfReportInput, context: Any = None) -> CommandResult[PerfReportOutput]:
    """
    Generate a performance report for an addon.
    """
    baseline = _load_baseline(input.addon)

    if not baseline["history"]:
        return success(
            data=PerfReportOutput(
                addon=input.addon,
                history=[],
                trend=None,
                report=f"No performance history for {input.addon}"
            ),
            reasoning="No measurements recorded"
        )

    history = baseline["history"][-input.limit:]

    # Calculate trends
    trend = None
    if len(baseline["history"]) >= 2:
        first = baseline["history"][0]
        last = baseline["history"][-1]

        if first["memory_kb"] > 0:
            mem_change = ((last["memory_kb"] - first["memory_kb"]) / first["memory_kb"]) * 100
        else:
            mem_change = 0

        if first["cpu_ms"] > 0:
            cpu_change = ((last["cpu_ms"] - first["cpu_ms"]) / first["cpu_ms"]) * 100
        else:
            cpu_change = 0

        trend = {
            "memory_change_pct": round(mem_change, 1),
            "cpu_change_pct": round(cpu_change, 1),
            "first_version": first["version"],
            "latest_version": last["version"]
        }

    # Build text report
    report_lines = [f"=== Performance History: {input.addon} ===\n"]
    for m in history:
        report_lines.append(
            f"  {m['version']} ({m['timestamp'][:10]}): "
            f"Memory: {m['memory_kb']:.1f} KB, CPU: {m['cpu_ms']:.2f} ms"
        )

    if trend:
        report_lines.append(f"\nTrend since {trend['first_version']}:")
        sign_mem = "+" if trend["memory_change_pct"] >= 0 else ""
        sign_cpu = "+" if trend["cpu_change_pct"] >= 0 else ""
        report_lines.append(f"  Memory: {sign_mem}{trend['memory_change_pct']}%")
        report_lines.append(f"  CPU: {sign_cpu}{trend['cpu_change_pct']}%")

    report = "\n".join(report_lines)

    return success(
        data=PerfReportOutput(
            addon=input.addon,
            history=history,
            trend=trend,
            report=report
        ),
        reasoning=f"Generated report with {len(history)} measurements"
    )


async def _perf_list(input: PerfListInput, context: Any = None) -> CommandResult[PerfListOutput]:
    """
    List all addons with performance baselines.
    """
    baselines_dir = _get_baselines_dir()
    addons = []

    for path in baselines_dir.glob("*_baseline.json"):
        addon_name = path.stem.replace("_baseline", "")
        addons.append(addon_name)

    addons.sort()

    return success(
        data=PerfListOutput(addons=addons, count=len(addons)),
        reasoning=f"Found {len(addons)} addons with performance baselines"
    )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════

def register_commands(server):
    """Register performance profiling commands with the AFD server."""

    server.command(
        name="perf.baseline",
        description="Record a performance baseline measurement for an addon",
        input_schema=PerfBaselineInput,
        output_schema=PerfBaselineOutput,
    )(_perf_baseline)

    server.command(
        name="perf.compare",
        description="Compare current performance against baseline and detect regressions",
        input_schema=PerfCompareInput,
        output_schema=PerfCompareOutput,
    )(_perf_compare)

    server.command(
        name="perf.report",
        description="Generate a performance report showing history and trends",
        input_schema=PerfReportInput,
        output_schema=PerfReportOutput,
    )(_perf_report)

    server.command(
        name="perf.list",
        description="List all addons with performance baselines",
        input_schema=PerfListInput,
        output_schema=PerfListOutput,
    )(_perf_list)
