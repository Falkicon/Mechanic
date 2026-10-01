"""
Performance profiling commands for WoW addon development.
Tracks performance baselines and detects regressions.

Migrated from ADDON_DEV/Tools/PerformanceProfiler to AFD commands.
"""

import json
import os
import tempfile
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, error, success
from pydantic import BaseModel, Field

from ..config import get_data_dir
from ._common import is_safe_component


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class PerfBaselineInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")
    version: str = Field(..., description="Version being measured")
    memory_kb: float = Field(..., ge=0, description="Memory usage in KB")
    cpu_ms: float = Field(..., ge=0, description="CPU time in milliseconds")


class PerfBaselineOutput(BaseModel):
    addon: str
    version: str
    memory_kb: float
    cpu_ms: float
    timestamp: str
    history_count: int


class PerfCompareInput(BaseModel):
    addon: str = Field(..., description="Name of the addon")
    memory_kb: float = Field(..., ge=0, description="Current memory usage in KB")
    cpu_ms: float = Field(..., ge=0, description="Current CPU time in milliseconds")
    memory_threshold: float = Field(
        default=1.5, gt=0, description="Memory increase factor that triggers warning"
    )
    cpu_threshold: float = Field(
        default=2.0, gt=0, description="CPU increase factor that triggers warning"
    )


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
    limit: int = Field(
        default=10, ge=1, description="Number of recent measurements to show"
    )


class PerfReportOutput(BaseModel):
    addon: str
    history: List[Dict[str, Any]]
    trend: Optional[Dict[str, Any]] = None
    report: str


class PerfListInput(BaseModel):
    pass  # No input required


class PerfListOutput(BaseModel):
    addons: List[str]
    count: int


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


class BaselineError(ValueError):
    """A baseline file exists but cannot be used."""


def _get_baselines_dir() -> Path:
    """Where baselines live; only writers create it."""
    return get_data_dir(create=False) / "perf_baselines"


def _get_baseline_path(addon_name: str) -> Path:
    """Get the path to an addon's baseline file."""
    if not _is_safe_addon_name(addon_name):
        raise ValueError(
            "Addon name cannot contain path separators or reserved characters"
        )
    return _get_baselines_dir() / f"{addon_name}_baseline.json"


def _is_safe_addon_name(addon_name: str) -> bool:
    """Return whether an addon name is safe to use as a local baseline filename."""
    return is_safe_component(addon_name)


def _invalid_addon_error(addon_name: str):
    return error(
        code="INVALID_ADDON",
        message=f"Invalid addon name: {addon_name!r}",
        suggestion=(
            "Provide an addon folder name without path separators or reserved characters"
        ),
    )


def _baseline_error(exc: BaselineError):
    return error(
        code="BASELINE_CORRUPT",
        message=str(exc),
        suggestion="Fix or delete the baseline file named above; it was not modified",
    )


def _number(value: Any) -> bool:
    return isinstance(value, (int, float)) and not isinstance(value, bool)


def _load_baseline(addon_name: str) -> Dict[str, Any]:
    """Load an addon's baseline (empty when none). Raises BaselineError if unusable."""
    path = _get_baseline_path(addon_name)
    if not path.exists():
        return {"history": [], "thresholds": {}}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        raise BaselineError(f"Baseline file {path} is unreadable: {exc}") from exc
    history = data.get("history") if isinstance(data, dict) else None
    if not isinstance(history, list) or not all(
        isinstance(m, dict)
        and _number(m.get("memory_kb"))
        and _number(m.get("cpu_ms"))
        and isinstance(m.get("version"), str)
        and isinstance(m.get("timestamp"), str)
        for m in history
    ):
        raise BaselineError(f"Baseline file {path} does not have a valid history list")
    data.setdefault("thresholds", {})
    return data


def _save_baseline(addon_name: str, data: Dict[str, Any]):
    """Save baseline data via a temporary file so an interrupted write keeps the old one."""
    path = _get_baseline_path(addon_name)
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp_name = tempfile.mkstemp(dir=path.parent, prefix=path.name, suffix=".tmp")
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(json.dumps(data, indent=2))
        os.replace(tmp_name, path)
    except BaseException:
        Path(tmp_name).unlink(missing_ok=True)
        raise


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════


async def _perf_baseline(
    input: PerfBaselineInput, context: Any = None
) -> CommandResult[PerfBaselineOutput]:
    """
    Record a performance baseline measurement for an addon.
    """
    if not _is_safe_addon_name(input.addon):
        return _invalid_addon_error(input.addon)

    try:
        baseline = _load_baseline(input.addon)
    except BaselineError as exc:
        return _baseline_error(exc)

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
            history_count=len(baseline["history"]),
        ),
        reasoning=f"Recorded baseline for {input.addon} v{input.version}",
    )


async def _perf_compare(
    input: PerfCompareInput, context: Any = None
) -> CommandResult[PerfCompareOutput]:
    """
    Compare current performance metrics against the baseline and detect regressions.
    """
    if not _is_safe_addon_name(input.addon):
        return _invalid_addon_error(input.addon)

    try:
        baseline = _load_baseline(input.addon)
    except BaselineError as exc:
        return _baseline_error(exc)

    if not baseline["history"]:
        return success(
            data=PerfCompareOutput(
                addon=input.addon,
                has_regression=False,
                memory_regression=False,
                cpu_regression=False,
                current={"memory_kb": input.memory_kb, "cpu_ms": input.cpu_ms},
                message="No baseline to compare against",
            ),
            reasoning="No previous measurements found for comparison",
        )

    latest = baseline["history"][-1]
    memory_ratio = None
    cpu_ratio = None
    memory_regression = False
    cpu_regression = False

    if latest["memory_kb"] > 0:
        memory_ratio = round(input.memory_kb / latest["memory_kb"], 2)
        memory_regression = memory_ratio > input.memory_threshold

    if latest["cpu_ms"] > 0:
        cpu_ratio = round(input.cpu_ms / latest["cpu_ms"], 2)
        cpu_regression = cpu_ratio > input.cpu_threshold

    has_regression = memory_regression or cpu_regression

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
            message=message,
        ),
        reasoning=message,
    )


async def _perf_report(
    input: PerfReportInput, context: Any = None
) -> CommandResult[PerfReportOutput]:
    """
    Generate a performance report for an addon.
    """
    if not _is_safe_addon_name(input.addon):
        return _invalid_addon_error(input.addon)

    try:
        baseline = _load_baseline(input.addon)
    except BaselineError as exc:
        return _baseline_error(exc)

    if not baseline["history"]:
        return success(
            data=PerfReportOutput(
                addon=input.addon,
                history=[],
                trend=None,
                report=f"No performance history for {input.addon}",
            ),
            reasoning="No measurements recorded",
        )

    history = baseline["history"][-input.limit :]

    trend = None
    if len(baseline["history"]) >= 2:
        first = baseline["history"][0]
        last = baseline["history"][-1]

        if first["memory_kb"] > 0:
            mem_change = (
                (last["memory_kb"] - first["memory_kb"]) / first["memory_kb"]
            ) * 100
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
            "latest_version": last["version"],
        }

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
            addon=input.addon, history=history, trend=trend, report=report
        ),
        reasoning=f"Generated report with {len(history)} measurements",
    )


async def _perf_list(
    input: PerfListInput, context: Any = None
) -> CommandResult[PerfListOutput]:
    """
    List all addons with performance baselines.
    """
    baselines_dir = _get_baselines_dir()
    addons = []

    if baselines_dir.is_dir():
        for path in baselines_dir.glob("*_baseline.json"):
            addons.append(path.name.removesuffix("_baseline.json"))

    addons.sort()

    return success(
        data=PerfListOutput(addons=addons, count=len(addons)),
        reasoning=f"Found {len(addons)} addons with performance baselines",
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
