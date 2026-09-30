"""External command modules: loading, audit declaration, and failure isolation."""

import sys
import textwrap

import pytest
from pydantic import BaseModel

from mechanic import config as config_mod
from mechanic.commands import catalog, core


class _Empty(BaseModel):
    pass


@pytest.fixture
def isolated(monkeypatch, tmp_path):
    """Fresh audit sets and a clean server so other tests are unaffected."""
    monkeypatch.setattr(catalog, "EXTERNAL_READ_ONLY", set())
    monkeypatch.setattr(catalog, "EXTERNAL_MUTATING", set())
    monkeypatch.syspath_prepend(str(tmp_path))
    yield tmp_path
    for name in ("ext_ok", "ext_broken"):
        sys.modules.pop(name, None)


def test_config_reads_modules_from_env(monkeypatch):
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "a.b, c ,a.b")
    cfg = config_mod.MechanicConfig() if hasattr(config_mod, "MechanicConfig") else config_mod.get_config()
    assert cfg.command_modules == ["a.b", "c"]


def test_default_flavors_include_forever_beta():
    cfg = config_mod.get_config()
    assert "_classic_beta_" in cfg.flavors


def test_declare_external_extends_audit(isolated):
    catalog.declare_external(read_only=["x.read"], mutating=["x.write"])
    assert "x.read" in catalog.EXTERNAL_READ_ONLY
    assert "x.write" in catalog.EXTERNAL_MUTATING


@pytest.mark.asyncio
async def test_loader_registers_and_audits_module(isolated, monkeypatch):
    (isolated / "ext_ok.py").write_text(
        textwrap.dedent(
            '''
            from afd import success
            from pydantic import BaseModel

            READ_ONLY = {"ext.ping"}
            MUTATING = set()

            class In(BaseModel):
                pass

            class Out(BaseModel):
                ok: bool = True

            def register_commands(server):
                @server.command(name="ext.ping", description="ping", input_schema=In, output_schema=Out)
                async def ping(input, context=None):
                    return success(data=Out())
            '''
        ),
        encoding="utf-8",
    )
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "ext_ok")
    monkeypatch.setattr(core, "_commands_registered", False, raising=False)
    server = core.get_server()
    names = {c.name for c in server.list_commands()}
    assert "ext.ping" in names
    cmd = next(c for c in server.list_commands() if c.name == "ext.ping")
    assert cmd.mutation is False


def test_broken_module_is_skipped(isolated, monkeypatch, caplog):
    (isolated / "ext_broken.py").write_text("raise RuntimeError('boom')\n", encoding="utf-8")
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "ext_broken")

    class _Server:
        def list_commands(self):
            return []

    loaded = core._load_external_modules(_Server(), catalog)
    assert loaded == []
    assert "Skipping command module ext_broken" in caplog.text
