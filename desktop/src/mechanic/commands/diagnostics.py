"""On-demand self-overhead snapshots; no diagnostic polling or background tasks."""

import asyncio
import sys
from typing import Any
from pydantic import BaseModel, Field
from afd import success, error, CommandResult
from .. import telemetry
from ..config import get_data_dir
from ..storage import Storage
from ..targets import (
    DiagnosticTarget,
    SelectedTarget,
    TargetError,
    select_target,
    read_profile,
)


class MetricsInput(BaseModel):
    target: DiagnosticTarget | None = Field(
        None,
        description="Explicit target to include its last saved addon overhead snapshot",
    )


class RuntimeMetrics(BaseModel):
    available: bool = False
    reason: str | None = None
    async_tasks: int | None = None
    websocket_connections: int | None = None


class HistoryMetrics(BaseModel):
    available: bool
    reason: str | None = None
    file_bytes: int = 0
    rows: dict[str, int] = Field(default_factory=dict)


class AddonOverhead(BaseModel):
    captured_at: int | None = None
    active_tickers: int = 0
    perf_ticker_active: bool = False
    inspect_ticker_active: bool = False
    hub_sync_ms: float = 0
    ui_refresh_ms: float = 0


class MetricsOutput(BaseModel):
    desktop: telemetry.OverheadSnapshot
    runtime: RuntimeMetrics
    history: HistoryMetrics
    target: SelectedTarget | None = None
    addon: AddonOverhead | None = None
    addon_status: str


def register_commands(server):
    @server.command(
        name="diagnostic.metrics",
        description="Read bounded desktop overhead and optional explicitly selected addon snapshot",
        input_schema=MetricsInput,
        output_schema=MetricsOutput,
    )
    async def diagnostic_metrics(
        input: MetricsInput, context: Any = None
    ) -> CommandResult[MetricsOutput]:
        selected = None
        addon = None
        addon_status = "Not requested; provide an explicit target to read the last saved addon snapshot"
        if input.target is not None:
            if not any(input.target.model_dump().values()):
                return error(
                    code="TARGET_REQUIRED",
                    message="An empty target is not an explicit selection",
                    suggestion="Call diagnostic.targets and select a client/account/character/profile",
                )
            try:
                selected = select_target(input.target)
                snapshot = read_profile(selected).get("diagnosticOverhead")
                if snapshot is not None:
                    addon = AddonOverhead.model_validate(snapshot)
                    addon_status = "Last saved snapshot; not a live in-game measurement"
                else:
                    addon_status = (
                        "No saved addon overhead snapshot for the selected target"
                    )
            except TargetError as exc:
                return exc.result()
            except (ValueError, TypeError) as exc:
                return error(
                    code="INVALID_SNAPSHOT",
                    message=f"Invalid addon overhead snapshot: {exc}",
                    suggestion="Sync the selected addon profile in game and retry",
                )
        http = sys.modules.get("mechanic.server")
        runtime = RuntimeMetrics(reason="HTTP runtime is not running in this process")
        if http is not None and getattr(http, "http_runtime_running", False):
            runtime = RuntimeMetrics(
                available=True,
                async_tasks=len(asyncio.all_tasks()),
                websocket_connections=len(http.manager.active_connections),
            )
        return success(
            MetricsOutput(
                desktop=telemetry.metrics.snapshot(),
                runtime=runtime,
                history=HistoryMetrics(
                    **Storage.read_stats(get_data_dir(create=False) / "mechanic.db")
                ),
                target=selected,
                addon=addon,
                addon_status=addon_status,
            ),
            reasoning="Process-local counters and recent duration samples; history inspected read-only",
        )
