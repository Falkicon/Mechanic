"""Bounded process-local overhead counters. No inputs, outputs, timers or file writes."""

import math
import time
from collections import deque
from threading import RLock
from pydantic import BaseModel, Field


class DurationMetrics(BaseModel):
    count: int
    failures: int
    inflight: int
    sample_count: int
    mean_ms: float
    p95_ms: float
    max_ms: float


class OverheadSnapshot(BaseModel):
    uptime_seconds: float
    sample_limit: int
    series_limit: int
    series: dict[str, DurationMetrics] = Field(default_factory=dict)


class OverheadMetrics:
    def __init__(self, clock=time.perf_counter, sample_limit=128, series_limit=96):
        if sample_limit < 1 or series_limit < 1:
            raise ValueError("Telemetry limits must be positive")
        self.clock, self.sample_limit, self.series_limit = (
            clock,
            sample_limit,
            series_limit,
        )
        self.started = clock()
        self._series = {}
        self._lock = RLock()

    def begin(self, name):
        with self._lock:
            # Reserve one series for unknown/overflow names; names are never retained there.
            if name not in self._series and len(self._series) >= self.series_limit - 1:
                name = "other"
            if name not in self._series:
                self._series[name] = {
                    "count": 0,
                    "failures": 0,
                    "inflight": 0,
                    "samples": deque(maxlen=self.sample_limit),
                }
            self._series[name]["inflight"] += 1
            return name, self.clock()

    def finish(self, token, failed=False):
        name, started = token
        duration = max(0.0, (self.clock() - started) * 1000)
        with self._lock:
            series = self._series[name]
            series["inflight"] -= 1
            series["count"] += 1
            series["failures"] += int(failed)
            series["samples"].append(duration)

    def snapshot(self):
        with self._lock:
            result = {}
            for name, data in self._series.items():
                samples = sorted(data["samples"])
                result[name] = DurationMetrics(
                    count=data["count"],
                    failures=data["failures"],
                    inflight=data["inflight"],
                    sample_count=len(samples),
                    mean_ms=sum(samples) / len(samples) if samples else 0,
                    p95_ms=samples[math.ceil(len(samples) * 0.95) - 1]
                    if samples
                    else 0,
                    max_ms=max(samples, default=0),
                )
            return OverheadSnapshot(
                uptime_seconds=max(0, self.clock() - self.started),
                sample_limit=self.sample_limit,
                series_limit=self.series_limit,
                series=result,
            )


metrics = OverheadMetrics()


def instrument_server(server):
    """Install once before either transport registers handlers."""
    if getattr(server, "_overhead_instrumented", False):
        return
    execute = server.execute
    known = frozenset(command.name for command in server.list_commands())

    async def measured_execute(name, input, context=None):
        token = metrics.begin(f"command:{name}" if name in known else "command:unknown")
        failed = True
        try:
            result = await execute(name, input, context)
            failed = not result.success
            return result
        finally:
            metrics.finish(token, failed=failed)

    server.execute = measured_execute
    server._overhead_instrumented = True
