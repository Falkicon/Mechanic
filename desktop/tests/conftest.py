"""Collection-time isolation for the desktop test suite.

Mechanic is a local companion and normally reads ``~/.mechanic`` as well as
searching common World of Warcraft installation directories when modules are
imported.  A test run must not depend on the developer's machine or append
synthetic ``TestAddon`` measurements to their real history.  Set the process
environment before test modules are imported, then reset the config singleton
for each test so cached paths cannot cross test boundaries.
"""

from __future__ import annotations

import os
import shutil
import tempfile
from pathlib import Path

import pytest


# This is deliberately created while conftest.py is imported.  pytest imports
# conftest files before collecting test modules, so Mechanic's module-level
# config/storage initialization sees the isolated environment too.
_TEST_HOME = Path(tempfile.mkdtemp(prefix="mechanic-pytest-"))
_TEST_DATA = _TEST_HOME / "data"
_TEST_WOW_ROOT = _TEST_HOME / "wow-root-do-not-discover"
_TEST_DEV_PATH = _TEST_HOME / "dev-do-not-discover"
_TEST_CONFIG_HOME = _TEST_HOME / "config"

for _name in ("HOME", "USERPROFILE"):
    os.environ[_name] = str(_TEST_HOME)
os.environ["XDG_CONFIG_HOME"] = str(_TEST_CONFIG_HOME)
os.environ["MECHANIC_DATA_DIR"] = str(_TEST_DATA)
os.environ["MECHANIC_WOW_ROOT"] = str(_TEST_WOW_ROOT)
os.environ["MECHANIC_DEV_PATH"] = str(_TEST_DEV_PATH)


def pytest_sessionfinish(session: pytest.Session, exitstatus: int) -> None:
    """Remove the session sandbox after pytest has finished."""

    shutil.rmtree(_TEST_HOME, ignore_errors=True)


@pytest.fixture(autouse=True)
def isolate_mechanic_discovery(monkeypatch: pytest.MonkeyPatch):
    """Keep config, storage, and WoW discovery inside the test sandbox."""

    from mechanic import config

    # The production discovery fallback intentionally checks well-known
    # machine paths.  Patch only the test process; production behavior stays
    # unchanged while tests remain deterministic on developer and CI hosts.
    monkeypatch.setattr(config, "get_common_wow_roots", lambda: [])
    monkeypatch.setattr(
        config,
        "get_config_paths",
        lambda: [_TEST_CONFIG_HOME / "missing-config.json"],
    )
    config.MechanicConfig.reset()
    yield
    config.MechanicConfig.reset()
