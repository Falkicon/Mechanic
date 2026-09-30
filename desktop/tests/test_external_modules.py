"""External command modules: loading, audit declaration, and failure isolation."""

import sys
import textwrap

import pytest
from afd.server import create_server

from mechanic import config as config_mod
from mechanic.commands import catalog, core

EXT_OK = textwrap.dedent(
    """
    from afd import success
    from pydantic import BaseModel

    READ_ONLY = {"ext.ping"}
    MUTATING = {"ext.write"}


    class In(BaseModel):
        pass


    class Out(BaseModel):
        ok: bool = True


    def register_commands(server):
        @server.command(
            name="ext.ping", description="ping", input_schema=In, output_schema=Out
        )
        async def ping(input, context=None):
            return success(data=Out())

        @server.command(
            name="ext.write", description="write", input_schema=In, output_schema=Out
        )
        async def write(input, context=None):
            return success(data=Out())
    """
)


@pytest.fixture
def isolated(monkeypatch, tmp_path):
    """Fresh audit sets and an importable temp folder; other tests are unaffected."""
    monkeypatch.setattr(catalog, "EXTERNAL_READ_ONLY", set())
    monkeypatch.setattr(catalog, "EXTERNAL_MUTATING", set())
    monkeypatch.syspath_prepend(str(tmp_path))
    yield tmp_path
    for name in ("ext_ok", "ext_broken"):
        sys.modules.pop(name, None)


def test_config_reads_modules_from_env(monkeypatch):
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "a.b, c ,a.b")
    assert config_mod.get_config().command_modules == ["a.b", "c"]


def test_default_flavors_include_forever_beta():
    assert "_classic_beta_" in config_mod.get_config().flavors


def test_declare_external_extends_audit(isolated):
    catalog.declare_external(read_only=["x.read"], mutating=["x.write"])
    assert "x.read" in catalog.EXTERNAL_READ_ONLY
    assert "x.write" in catalog.EXTERNAL_MUTATING


def test_loader_registers_and_audits_module(isolated, monkeypatch):
    (isolated / "ext_ok.py").write_text(EXT_OK, encoding="utf-8")
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "ext_ok")
    server = create_server("external-modules")

    loaded = core._load_external_modules(server, catalog)
    catalog.apply_mutation_audit(server)

    assert loaded == ["ext_ok"]
    commands = {c.name: c for c in server.list_commands()}
    assert commands["ext.ping"].mutation is False
    assert commands["ext.write"].mutation is True


def test_undeclared_external_command_fails_the_audit(isolated, monkeypatch):
    (isolated / "ext_ok.py").write_text(
        EXT_OK.replace('MUTATING = {"ext.write"}', "MUTATING = set()"),
        encoding="utf-8",
    )
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "ext_ok")
    server = create_server("external-modules-unaudited")
    core._load_external_modules(server, catalog)
    with pytest.raises(ValueError, match="Missing mutation audit"):
        catalog.apply_mutation_audit(server)


def test_broken_module_is_skipped(isolated, monkeypatch, caplog):
    (isolated / "ext_broken.py").write_text(
        "raise RuntimeError('boom')\n", encoding="utf-8"
    )
    monkeypatch.setenv("MECHANIC_COMMAND_MODULES", "ext_broken")
    server = create_server("external-modules-broken")

    assert core._load_external_modules(server, catalog) == []
    assert "Skipping command module ext_broken" in caplog.text
