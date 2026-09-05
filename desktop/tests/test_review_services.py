"""Service supervision regressions; all services are in-memory fakes."""

import asyncio
from types import SimpleNamespace

import pytest

from mechanic import cli


@pytest.fixture
def services(monkeypatch):
    state = SimpleNamespace(
        server=None,
        watcher=None,
        behavior="wait",
        watcher_returns=False,
        watcher_error=False,
    )

    class Server:
        should_exit = False

        def __init__(self, config):
            state.server = self
            self.finished = False

        async def serve(self):
            try:
                if state.behavior == "error":
                    raise RuntimeError("bind failed")
                if state.behavior == "exit":
                    raise SystemExit(1)
                if state.behavior == "return":
                    return
                if state.behavior == "stubborn":
                    await asyncio.Event().wait()
                while not self.should_exit:
                    await asyncio.sleep(0)
            finally:
                self.finished = True

    class Watcher:
        def __init__(self, *args, **kwargs):
            state.watcher = self
            self.stopped = False
            self.finished = False

        async def start(self, stop_event):
            try:
                if state.watcher_error:
                    raise RuntimeError("watch failed")
                if not state.watcher_returns:
                    await stop_event.wait()
            finally:
                self.finished = True

        def stop(self):
            self.stopped = True

    monkeypatch.setattr(cli.uvicorn, "Server", Server)
    monkeypatch.setattr(cli, "SVWatcher", Watcher)
    return state


@pytest.mark.asyncio
@pytest.mark.parametrize("behavior", ["error", "exit", "return"])
async def test_server_early_completion_drains_services(services, behavior):
    services.behavior = behavior
    if behavior == "return":
        await asyncio.wait_for(cli.start_services(0, []), 1)
    else:
        with pytest.raises(RuntimeError):
            await asyncio.wait_for(cli.start_services(0, []), 1)
    assert services.server.finished
    assert services.watcher.stopped
    assert services.watcher.finished


@pytest.mark.asyncio
async def test_external_stop_drains_existing_services(services):
    stop = asyncio.Event()
    task = asyncio.create_task(cli.start_services(0, [], stop_event=stop))
    await asyncio.sleep(0)
    stop.set()
    await asyncio.wait_for(task, 1)
    assert services.server.should_exit
    assert services.server.finished
    assert services.watcher.finished


@pytest.mark.asyncio
async def test_cancelled_supervisor_drains_existing_services(services):
    task = asyncio.create_task(cli.start_services(0, []))
    await asyncio.sleep(0)
    task.cancel()
    with pytest.raises(asyncio.CancelledError):
        await asyncio.wait_for(task, 1)
    assert services.server.finished
    assert services.watcher.finished


@pytest.mark.asyncio
async def test_no_watch_paths_does_not_stop_dashboard(services):
    services.watcher_returns = True
    stop = asyncio.Event()
    task = asyncio.create_task(cli.start_services(0, [], stop_event=stop))
    for _ in range(5):
        await asyncio.sleep(0)
    assert not task.done()
    stop.set()
    await asyncio.wait_for(task, 1)


@pytest.mark.asyncio
async def test_watcher_failure_stops_server(services):
    services.watcher_error = True
    with pytest.raises(RuntimeError, match="watch failed"):
        await asyncio.wait_for(cli.start_services(0, []), 1)
    assert services.server.finished
    assert services.watcher.finished


@pytest.mark.asyncio
async def test_unresponsive_service_is_cancelled_after_grace_period(
    services, monkeypatch
):
    services.behavior = "stubborn"
    original_wait = asyncio.wait

    async def immediate_deadline(
        tasks, *, timeout=None, return_when=asyncio.ALL_COMPLETED
    ):
        return await original_wait(
            tasks, timeout=0 if timeout is not None else None, return_when=return_when
        )

    monkeypatch.setattr(cli.asyncio, "wait", immediate_deadline)
    stop = asyncio.Event()
    task = asyncio.create_task(cli.start_services(0, [], stop_event=stop))
    await asyncio.sleep(0)
    stop.set()
    await asyncio.wait_for(task, 1)
    assert services.server.finished
    assert services.watcher.finished


def test_keyboard_interrupt_resumes_existing_supervisor(monkeypatch):
    calls = []
    finished = []

    async def start_services(*args):
        calls.append(args)

        def interrupt():
            raise KeyboardInterrupt

        asyncio.get_running_loop().call_soon(interrupt)
        await args[-1].wait()
        finished.append(True)

    monkeypatch.setattr(cli, "start_services", start_services)
    cli.start_server(0, [])
    assert len(calls) == 1
    assert finished == [True]
