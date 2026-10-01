"""addon.create, addon.sync, libs.* and system.pick_file regression tests."""

import json
import os
import subprocess
import sys
from types import SimpleNamespace

import pytest

from mechanic.commands import environment
from mechanic.commands.core import get_server


def config_for(tmp_path, **extra):
    values = dict(
        dev_path=tmp_path / "dev",
        template_path=None,
        data_dir=tmp_path / "data",
        wow_root=tmp_path / "wow",
        flavors=["_retail_", "_beta_"],
    )
    values.update(extra)
    return SimpleNamespace(**values)


# ── addon.create ─────────────────────────────────────────────────────────────


@pytest.fixture
def template(tmp_path):
    root = tmp_path / "_TemplateAddon"
    nested = root / "TemplateAddon"
    (nested / "Libs").mkdir(parents=True)
    (nested / "Locales").mkdir()
    (nested / "TemplateAddon.toc").write_text(
        "## Interface: 120001\n## Title: TemplateAddon\n## Author: YourName\n"
        "## SavedVariables: TemplateAddonDB\nLocales\\enUS.lua\nCore.lua\n",
        encoding="utf-8",
    )
    (nested / "Core.lua").write_text(
        'local A = LibStub("AceAddon-3.0"):NewAddon("TemplateAddon")\n',
        encoding="utf-8",
    )
    (nested / "Locales" / "enUS.lua").write_text(
        'NewLocale("TemplateAddon", "enUS", true)\n', encoding="utf-8"
    )
    (nested / ".pkgmeta").write_text("package-as: TemplateAddon\n", encoding="utf-8")
    (nested / ".luacheckrc").write_text(
        'globals = { "TemplateAddonDB" }\n', encoding="utf-8"
    )
    (nested / "Libs" / "Lib.lua").write_text(
        "-- TemplateAddon vendored\n", encoding="utf-8"
    )
    (nested / "blob.bin").write_bytes(b"\x00TemplateAddon\x00")
    (root / "README.md").write_text("# TemplateAddon\nBy YourName\n", encoding="utf-8")
    (root / ".git").mkdir()
    (root / ".git" / "HEAD").write_text("ref", encoding="utf-8")
    return root


@pytest.fixture
def dev(tmp_path, template, monkeypatch):
    (tmp_path / "dev").mkdir()
    monkeypatch.setattr(
        environment, "get_config", lambda: config_for(tmp_path, template_path=template)
    )
    return tmp_path / "dev"


@pytest.mark.asyncio
async def test_create_personalises_every_text_file_and_renames(dev):
    result = await get_server().execute(
        "addon.create", {"name": "Weekly", "author": "Jane Doe"}
    )

    assert result.success, result.error
    root = dev / "Weekly"
    addon = root / "Weekly"
    assert (addon / "Weekly.toc").read_text(encoding="utf-8") == (
        "## Interface: 120001\n## Title: Weekly\n## Author: Jane Doe\n"
        "## SavedVariables: WeeklyDB\nLocales\\enUS.lua\nCore.lua\n"
    )
    assert 'NewAddon("Weekly")' in (addon / "Core.lua").read_text(encoding="utf-8")
    assert (addon / ".pkgmeta").read_text(encoding="utf-8") == "package-as: Weekly\n"
    assert "WeeklyDB" in (addon / ".luacheckrc").read_text(encoding="utf-8")
    assert (root / "README.md").read_text(encoding="utf-8") == "# Weekly\nBy Jane Doe\n"
    assert "TemplateAddon" in (addon / "Libs" / "Lib.lua").read_text(encoding="utf-8")
    assert (addon / "blob.bin").read_bytes() == b"\x00TemplateAddon\x00"
    assert not (root / ".git").exists()
    assert not any("TemplateAddon" in p.name for p in root.rglob("*"))
    assert result.data.files_created == sum(1 for p in root.rglob("*") if p.is_file())
    assert result.data.next_steps[:2] == [
        'mech call addon.sync \'{"addon": "Weekly"}\'',
        'mech call addon.validate \'{"addon": "Weekly"}\'',
    ]
    assert not any("-i" in step.split() for step in result.data.next_steps)


@pytest.mark.asyncio
async def test_create_without_author_keeps_placeholder_and_says_so(dev):
    result = await get_server().execute("addon.create", {"name": "Weekly"})

    assert result.success, result.error
    toc = (dev / "Weekly" / "Weekly" / "Weekly.toc").read_text(encoding="utf-8")
    assert "## Author: YourName" in toc
    assert any("Set ## Author" in step for step in result.data.next_steps)


@pytest.mark.parametrize(
    "name",
    ["../escape", "a/b", "a\\b", "C:\\Windows", "..", ".", " ", "bad:name", "x."],
)
@pytest.mark.asyncio
async def test_create_rejects_unsafe_names(dev, tmp_path, name):
    result = await get_server().execute("addon.create", {"name": name})

    assert not result.success and result.error.code == "INVALID_NAME"
    assert result.error.suggestion
    assert not (tmp_path / "escape").exists()
    assert list(dev.iterdir()) == []


@pytest.mark.asyncio
async def test_create_rejects_multiline_author(dev):
    result = await get_server().execute(
        "addon.create", {"name": "Weekly", "author": "a\n## Interface: 1"}
    )

    assert result.error.code == "INVALID_AUTHOR"
    assert list(dev.iterdir()) == []


@pytest.mark.asyncio
async def test_create_existing_addon_is_refused(dev):
    (dev / "Weekly").mkdir()

    result = await get_server().execute("addon.create", {"name": "Weekly"})

    assert result.error.code == "ADDON_EXISTS"


@pytest.mark.asyncio
async def test_create_failure_leaves_nothing_behind(dev, monkeypatch):
    def boom(*args, **kwargs):
        raise OSError("disk full")

    monkeypatch.setattr(environment, "_rewrite_template_file", boom)
    result = await get_server().execute("addon.create", {"name": "Weekly"})

    assert not result.success and result.error.code == "COPY_FAILED"
    assert "disk full" in result.error.message and result.error.suggestion
    assert not (dev / "Weekly").exists()


@pytest.mark.asyncio
async def test_create_missing_template_is_actionable(tmp_path, monkeypatch):
    (tmp_path / "dev").mkdir()
    monkeypatch.setattr(environment, "get_config", lambda: config_for(tmp_path))

    result = await get_server().execute("addon.create", {"name": "Weekly"})

    assert result.error.code == "TEMPLATE_NOT_FOUND" and result.error.suggestion


# ── addon.sync ───────────────────────────────────────────────────────────────


@pytest.fixture
def sync(tmp_path, monkeypatch):
    addon = tmp_path / "repo" / "Demo"
    addon.mkdir(parents=True)
    (addon / "Demo.toc").write_text("## Title: Demo\n", encoding="utf-8")
    wow = tmp_path / "wow"
    (wow / "_retail_").mkdir(parents=True)
    monkeypatch.setattr(environment, "find_addon_path", lambda *args: addon)
    monkeypatch.setattr(environment, "get_config", lambda: config_for(tmp_path))
    return addon, wow


@pytest.mark.asyncio
async def test_sync_skips_uninstalled_clients_and_creates_nothing_there(sync):
    addon, wow = sync

    preview = await get_server().execute(
        "addon.sync", {"addon": "Demo", "dry_run": True}
    )

    assert preview.success, preview.error
    statuses = {lk.flavor: lk.status for lk in preview.data.links}
    assert statuses == {
        "_retail_": "planned",
        "_beta_": "skipped: client not installed",
    }
    assert (
        not (wow / "_beta_").exists() and not (wow / "_retail_" / "Interface").exists()
    )


@pytest.mark.asyncio
async def test_sync_creates_a_working_link_only_in_installed_clients(sync):
    addon, wow = sync

    result = await get_server().execute("addon.sync", {"addon": "Demo"})

    assert result.success, result.error
    link = wow / "_retail_" / "Interface" / "AddOns" / "Demo"
    assert (link / "Demo.toc").read_text(encoding="utf-8") == "## Title: Demo\n"
    assert link.resolve() == addon.resolve()
    assert result.data.success_count == 1 and result.data.error_count == 0
    assert not (wow / "_beta_").exists()

    again = await get_server().execute("addon.sync", {"addon": "Demo"})
    assert again.success and again.data.links[0].status == "exists"


@pytest.mark.asyncio
async def test_sync_requires_the_toc_in_the_source_folder(sync):
    addon, wow = sync
    (addon / "Demo.toc").unlink()

    result = await get_server().execute("addon.sync", {"addon": "Demo"})

    assert not result.success and result.error.code == "NO_TOC"
    assert result.error.suggestion
    assert not (wow / "_retail_" / "Interface").exists()


@pytest.mark.asyncio
async def test_sync_with_no_installed_client_is_an_error(sync):
    result = await get_server().execute(
        "addon.sync", {"addon": "Demo", "flavors": ["_ptr_"]}
    )

    assert result.error.code == "NO_CLIENT_FOUND" and result.error.suggestion


@pytest.mark.asyncio
async def test_sync_conflicting_existing_folder_is_reported(sync):
    addon, wow = sync
    target = wow / "_retail_" / "Interface" / "AddOns" / "Demo"
    target.mkdir(parents=True)

    result = await get_server().execute("addon.sync", {"addon": "Demo"})

    assert result.error.code == "SYNC_PREFLIGHT_FAILED"
    assert target.is_dir() and not target.is_symlink()


@pytest.mark.asyncio
async def test_sync_rejects_unsafe_addon_name(sync):
    result = await get_server().execute("addon.sync", {"addon": "..\\Demo"})

    assert result.error.code == "INVALID_TARGET"


# ── libs.* ───────────────────────────────────────────────────────────────────


@pytest.fixture
def libs(tmp_path, monkeypatch):
    addon = tmp_path / "Demo"
    (addon / "Libs" / "One").mkdir(parents=True)
    (addon / "Libs" / "One" / "One.lua").write_text(
        "local MINOR = 7\n", encoding="utf-8"
    )
    (addon / "Libs" / "Stray").mkdir()
    source = tmp_path / "shared"
    for name in ("One", "Two"):
        (source / name).mkdir(parents=True)
        (source / name / "code.lua").write_text(f"-- {name} new\n", encoding="utf-8")
    monkeypatch.setattr(environment, "find_addon_path", lambda *args: addon)
    monkeypatch.setattr(environment, "get_config", lambda: config_for(tmp_path))
    return addon, source


def write_libs_json(addon, payload):
    (addon / "Libs" / "libs.json").write_text(json.dumps(payload), encoding="utf-8")


@pytest.mark.asyncio
async def test_libs_check_reports_ok_missing_and_extra(libs):
    addon, _ = libs
    write_libs_json(
        addon, {"mode": "include", "libraries": {"One": "latest", "Two": "1.0"}}
    )

    result = await get_server().execute("libs.check", {"addon": "Demo"})

    assert result.success, result.error
    status = {lk.name: lk.status for lk in result.data.libraries}
    assert status == {"One": "ok", "Stray": "extra", "Two": "missing"}
    installed = {lk.name: lk.installed_version for lk in result.data.libraries}
    assert installed["One"] == "r7"
    assert "Missing: Two" in result.data.issues and result.data.has_config


@pytest.mark.asyncio
async def test_libs_check_without_config_and_with_non_table_config(libs):
    addon, _ = libs
    plain = await get_server().execute("libs.check", {"addon": "Demo"})
    assert plain.success and not plain.data.has_config
    assert any("libs.init" in issue for issue in plain.data.issues)

    (addon / "Libs" / "libs.json").write_text("[1, 2]", encoding="utf-8")
    listed = await get_server().execute("libs.check", {"addon": "Demo"})
    assert listed.success and not listed.data.has_config


@pytest.mark.asyncio
async def test_libs_init_creates_then_refuses_then_overwrites(libs):
    addon, _ = libs

    created = await get_server().execute("libs.init", {"addon": "Demo"})
    again = await get_server().execute("libs.init", {"addon": "Demo"})
    forced = await get_server().execute(
        "libs.init", {"addon": "Demo", "overwrite": True}
    )

    assert created.success and created.data.libraries == {
        "One": "latest",
        "Stray": "latest",
    }
    assert json.loads((addon / "Libs" / "libs.json").read_text(encoding="utf-8"))[
        "libraries"
    ] == {"One": "latest", "Stray": "latest"}
    assert again.error.code == "CONFIG_EXISTS" and again.error.suggestion
    assert forced.success


@pytest.mark.asyncio
async def test_libs_sync_copies_force_updates_and_removes_extras(libs):
    addon, source = libs
    write_libs_json(
        addon,
        {
            "mode": "include",
            "libraries": {"One": "latest", "Two": "latest"},
            "notes": ["x"],
        },
    )

    skipped = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source)}
    )
    assert skipped.success, skipped.error
    assert (skipped.data.copied, skipped.data.skipped) == (1, 1)
    assert (addon / "Libs" / "Two" / "code.lua").exists()
    assert not (addon / "Libs" / "One" / "code.lua").exists()

    forced = await get_server().execute(
        "libs.sync",
        {"addon": "Demo", "source": str(source), "force": True, "remove_extra": True},
    )
    assert forced.success, forced.error
    assert (forced.data.updated, forced.data.removed) == (2, 1)
    assert (addon / "Libs" / "One" / "code.lua").read_text(
        encoding="utf-8"
    ) == "-- One new\n"
    assert not (addon / "Libs" / "Stray").exists()
    leftovers = [
        p.name
        for p in (addon / "Libs").iterdir()
        if p.name.endswith((".mechanic-new", ".mechanic-old"))
    ]
    assert leftovers == []


@pytest.mark.asyncio
async def test_libs_force_update_keeps_old_copy_when_the_copy_fails(libs, monkeypatch):
    addon, source = libs
    write_libs_json(addon, {"mode": "include", "libraries": {"One": "latest"}})
    (addon / "Libs" / "One" / "keep.lua").write_text("mine", encoding="utf-8")
    real = environment.shutil.copytree

    def failing(src, dst, **kwargs):
        if str(dst).endswith(".mechanic-new"):
            os.makedirs(dst)
            raise OSError("copy interrupted")
        return real(src, dst, **kwargs)

    monkeypatch.setattr(environment.shutil, "copytree", failing)
    result = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source), "force": True}
    )

    assert not result.success and result.error.code == "LIBS_PARTIAL_FAILURE"
    assert (addon / "Libs" / "One" / "keep.lua").read_text(encoding="utf-8") == "mine"
    assert not (addon / "Libs" / "One.mechanic-new").exists()


@pytest.mark.asyncio
async def test_libs_sync_guards_against_malformed_config(libs):
    addon, source = libs
    (addon / "Libs" / "libs.json").write_text("[]", encoding="utf-8")
    listed = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source)}
    )
    assert listed.error.code == "NO_CONFIG"

    write_libs_json(addon, {"mode": "include", "libraries": ["One"]})
    bad = await get_server().execute(
        "libs.sync", {"addon": "Demo", "source": str(source)}
    )
    assert bad.error.code == "INVALID_CONFIG" and bad.error.suggestion

    write_libs_json(addon, {"mode": "include", "libraries": {"..": "latest"}})
    traversal = await get_server().execute("libs.sync", {"addon": "Demo"})
    assert traversal.error.code == "INVALID_CONFIG"


# ── system.pick_file ─────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_pick_file_unsupported_platform(monkeypatch):
    monkeypatch.setattr(sys, "platform", "linux")

    result = await get_server().execute("system.pick_file", {})

    assert result.error.code == "UNSUPPORTED_PLATFORM" and result.error.suggestion


@pytest.mark.asyncio
async def test_pick_file_reports_powershell_failure(monkeypatch):
    monkeypatch.setattr(sys, "platform", "win32")
    monkeypatch.setattr(
        environment.subprocess,
        "run",
        lambda *a, **k: SimpleNamespace(returncode=1, stdout="", stderr="no desktop"),
    )

    result = await get_server().execute("system.pick_file", {})

    assert result.error.code == "PICKER_FAILED" and "no desktop" in result.error.message
    assert result.error.suggestion


@pytest.mark.asyncio
async def test_pick_file_timeout_and_selection(monkeypatch, tmp_path):
    monkeypatch.setattr(sys, "platform", "win32")
    chosen = tmp_path / "picked.txt"
    chosen.write_text("x", encoding="utf-8")

    def timeout(*a, **k):
        raise subprocess.TimeoutExpired("powershell", 60)

    monkeypatch.setattr(environment.subprocess, "run", timeout)
    timed_out = await get_server().execute("system.pick_file", {})
    assert timed_out.error.code == "TIMEOUT" and timed_out.error.suggestion

    monkeypatch.setattr(
        environment.subprocess,
        "run",
        lambda *a, **k: SimpleNamespace(returncode=0, stdout=f"{chosen}\n", stderr=""),
    )
    picked = await get_server().execute("system.pick_file", {})
    assert picked.success and picked.data.filename == "picked.txt"

    monkeypatch.setattr(
        environment.subprocess,
        "run",
        lambda *a, **k: SimpleNamespace(returncode=0, stdout="", stderr=""),
    )
    cancelled = await get_server().execute("system.pick_file", {})
    assert cancelled.error.code == "NO_SELECTION" and cancelled.error.suggestion
