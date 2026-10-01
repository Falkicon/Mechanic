"""assets.sync, locale.*, and perf.* regression tests."""

import json
import os
import sys
import types

import pytest

from mechanic.commands import assets
from mechanic.commands.core import get_server


class FakeImage:
    """Stands in for Pillow: a "png" here is text holding ``WIDTHxHEIGHT``."""

    mode = "RGBA"

    def __init__(self, size):
        self.size = size

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        return False

    def convert(self, mode):
        return self

    def save(self, path, fmt):
        with open(path, "wb") as handle:
            handle.write(f"{fmt} {self.size[0]}x{self.size[1]}".encode())


def fake_pillow(monkeypatch):
    def open_image(path):
        width, height = open(path, encoding="utf-8").read().split("x")
        return FakeImage((int(width), int(height)))

    image = types.ModuleType("PIL.Image")
    image.open = open_image
    package = types.ModuleType("PIL")
    package.Image = image
    monkeypatch.setitem(sys.modules, "PIL", package)
    monkeypatch.setitem(sys.modules, "PIL.Image", image)


def make_png(path, size="16x16"):
    path.write_text(size, encoding="utf-8")


# ── assets.sync ──────────────────────────────────────────────────────────────


@pytest.fixture
def art(tmp_path, monkeypatch):
    addon = tmp_path / "Demo"
    (addon / "assets_source" / "ui").mkdir(parents=True)
    fake_pillow(monkeypatch)
    make_png(addon / "assets_source" / "ui" / "icon.png")
    make_png(addon / "assets_source" / "odd.png", "10x16")
    (addon / "assets_source" / "sound.ogg").write_bytes(b"ogg")
    monkeypatch.setattr(assets, "find_addon_path", lambda *args: addon)
    return addon


async def sync(**params):
    return await get_server().execute("assets.sync", {"addon": "Demo", **params})


@pytest.mark.asyncio
async def test_sync_converts_copies_warns_and_writes_manifest(art):
    result = await sync()

    assert result.success, result.error
    data = result.data
    assert (data.converted, data.copied, data.removed) == (2, 1, 0)
    assert any("odd.png" in w and "Width (10)" in w for w in data.warnings)
    assert (art / "assets" / "ui" / "icon.tga").is_file()
    assert (art / "assets" / "sound.ogg").read_bytes() == b"ogg"
    manifest = json.loads(
        (art / "assets" / ".mechanic-assets.json").read_text(encoding="utf-8")
    )
    assert manifest["generated"] == ["odd.tga", "sound.ogg", "ui/icon.tga"]


@pytest.mark.asyncio
async def test_sync_never_deletes_hand_made_assets(art):
    (art / "assets").mkdir()
    hand_made = art / "assets" / "crest.blp"
    hand_made.write_bytes(b"blp")
    (art / "assets" / "hand.tga").write_bytes(b"tga")

    first = await sync()
    second = await sync()

    assert first.success and second.success
    assert first.data.removed == 0 and second.data.removed == 0
    assert hand_made.read_bytes() == b"blp"
    assert (art / "assets" / "hand.tga").read_bytes() == b"tga"


@pytest.mark.asyncio
async def test_sync_removes_only_generated_files_whose_source_is_gone(art):
    (art / "assets").mkdir()
    (art / "assets" / "crest.blp").write_bytes(b"blp")
    await sync()
    (art / "assets_source" / "ui" / "icon.png").unlink()
    (art / "assets_source" / "sound.ogg").unlink()

    preview = await sync(dry_run=True)
    assert preview.data.dry_run and preview.data.removed == 2
    assert (art / "assets" / "ui" / "icon.tga").exists()  # dry run changes nothing

    result = await sync()

    assert sorted(result.data.removed_files) == ["sound.ogg", "ui/icon.tga"]
    assert not (art / "assets" / "ui").exists()  # emptied folder dropped
    assert not (art / "assets" / "sound.ogg").exists()
    assert (art / "assets" / "odd.tga").exists()
    assert (art / "assets" / "crest.blp").read_bytes() == b"blp"


@pytest.mark.asyncio
async def test_sync_dry_run_writes_nothing(art):
    result = await sync(dry_run=True)

    assert result.success and result.data.converted == 2 and result.data.copied == 1
    assert not (art / "assets").exists()


@pytest.mark.asyncio
async def test_sync_ignores_manifest_entries_that_escape_the_folder(art):
    (art / "assets").mkdir()
    outside = art / "precious.txt"
    outside.write_text("keep", encoding="utf-8")
    (art / "assets" / ".mechanic-assets.json").write_text(
        json.dumps({"generated": ["../precious.txt"]}), encoding="utf-8"
    )

    result = await sync()

    assert result.success and result.data.removed == 0
    assert outside.read_text(encoding="utf-8") == "keep"


@pytest.mark.asyncio
async def test_sync_is_incremental(art):
    await sync()
    again = await sync()

    assert (again.data.converted, again.data.copied) == (0, 0)
    future = os.stat(art / "assets_source" / "sound.ogg").st_mtime + 50
    os.utime(art / "assets_source" / "sound.ogg", (future, future))
    (art / "assets_source" / "sound.ogg").write_bytes(b"new")
    os.utime(art / "assets_source" / "sound.ogg", (future, future))
    changed = await sync()
    assert changed.data.copied == 1
    assert (art / "assets" / "sound.ogg").read_bytes() == b"new"


@pytest.mark.asyncio
async def test_assets_list_hides_the_manifest(art):
    await sync()

    result = await get_server().execute("assets.list", {"addon": "Demo"})

    assert result.success
    assert ".mechanic-assets.json" not in result.data.target_files
    assert result.data.target_files == ["odd.tga", "sound.ogg", "ui/icon.tga"]
    assert result.data.source_count == 3


@pytest.mark.asyncio
async def test_sync_without_source_folder_is_actionable(art):
    import shutil

    shutil.rmtree(art / "assets_source")

    result = await sync()

    assert result.error.code == "NO_ASSETS_SOURCE" and result.error.suggestion


# ── locale.* ─────────────────────────────────────────────────────────────────


@pytest.fixture
def locales(tmp_path):
    addon = tmp_path / "libs" / "Demo"  # an ancestor named "libs" must not hide files
    (addon / "Locales").mkdir(parents=True)
    keys = [f"Key {i:02d}" for i in range(14)]
    (addon / "Locales" / "enUS.lua").write_text(
        "".join(f'L["{k}"] = true\n' for k in keys), encoding="utf-8"
    )
    (addon / "Locales" / "deDE.lua").write_text('L["Key 00"] = "x"\n', encoding="utf-8")
    (addon / "Locales" / "frFR.lua").write_text(
        "".join(f'L["{k}"] = "y"\n' for k in keys), encoding="utf-8"
    )
    (addon / "Core.lua").write_text(
        'local t = L["Hello there"]\nframe:SetText("Some label")\nname = "x"\n',
        encoding="utf-8",
    )
    (addon / "Libs").mkdir()
    (addon / "Libs" / "Skip.lua").write_text(
        'local t = L["Vendored text"]\n', encoding="utf-8"
    )
    return addon


@pytest.mark.asyncio
async def test_locale_validate_is_deterministic_with_true_counts(locales):
    params = {"addon": "Demo", "path": str(locales)}

    first = await get_server().execute("locale.validate", params)
    second = await get_server().execute("locale.validate", params)

    assert first.success, first.error
    data = first.data
    assert not data.valid and data.baseline_keys == 14
    assert data.locales_found == ["deDE", "frFR"]
    (missing,) = data.missing
    assert missing.locale == "deDE" and missing.missing_count == 13
    assert missing.missing_keys == [f"Key {i:02d}" for i in range(1, 11)]
    assert first.warnings[0].message == "deDE: 13 missing keys"
    assert second.data.missing[0].missing_keys == missing.missing_keys


@pytest.mark.asyncio
async def test_locale_validate_without_locales_and_without_baseline(tmp_path, locales):
    bare = tmp_path / "Bare"
    bare.mkdir()
    none = await get_server().execute(
        "locale.validate", {"addon": "Bare", "path": str(bare)}
    )
    assert none.success and none.data.valid

    (locales / "Locales" / "enUS.lua").unlink()
    missing = await get_server().execute(
        "locale.validate", {"addon": "Demo", "path": str(locales)}
    )
    assert missing.error.code == "NO_BASELINE" and missing.error.suggestion


@pytest.mark.asyncio
async def test_locale_extract_skips_libs_only_below_the_addon(locales):
    result = await get_server().execute(
        "locale.extract", {"addon": "Demo", "path": str(locales)}
    )

    assert result.success, result.error
    strings = result.data.strings
    assert "Hello there" in strings and "Some label" in strings
    assert "Vendored text" not in strings
    assert strings == sorted(strings)


# ── perf.* ───────────────────────────────────────────────────────────────────


@pytest.fixture
def perf_dir(tmp_path, monkeypatch):
    monkeypatch.setenv("MECHANIC_DATA_DIR", str(tmp_path / "data"))
    return tmp_path / "data" / "perf_baselines"


async def record(version, memory, cpu, addon="Demo"):
    return await get_server().execute(
        "perf.baseline",
        {"addon": addon, "version": version, "memory_kb": memory, "cpu_ms": cpu},
    )


@pytest.mark.asyncio
async def test_read_commands_never_create_directories(perf_dir, tmp_path):
    listed = await get_server().execute("perf.list", {})
    compared = await get_server().execute(
        "perf.compare", {"addon": "Demo", "memory_kb": 1, "cpu_ms": 1}
    )
    report = await get_server().execute("perf.report", {"addon": "Demo"})

    assert listed.success and listed.data.count == 0
    assert compared.success and not compared.data.has_regression
    assert report.success and report.data.history == []
    assert not (tmp_path / "data").exists()


@pytest.mark.asyncio
async def test_compare_flags_memory_and_cpu_regressions(perf_dir):
    await record("1.0", 100, 2)
    await record("1.1", 200, 4)

    ok = await get_server().execute(
        "perf.compare", {"addon": "Demo", "memory_kb": 250, "cpu_ms": 6}
    )
    both = await get_server().execute(
        "perf.compare", {"addon": "Demo", "memory_kb": 400, "cpu_ms": 9}
    )
    only_cpu = await get_server().execute(
        "perf.compare",
        {"addon": "Demo", "memory_kb": 200, "cpu_ms": 9, "cpu_threshold": 2.0},
    )

    assert not ok.data.has_regression
    assert (ok.data.memory_ratio, ok.data.cpu_ratio) == (1.25, 1.5)
    assert both.data.memory_regression and both.data.cpu_regression
    assert (
        both.data.message
        == "REGRESSION DETECTED: memory increased 2.0x, CPU increased 2.25x"
    )
    assert only_cpu.data.cpu_regression and not only_cpu.data.memory_regression
    assert ok.data.previous["version"] == "1.1"


@pytest.mark.asyncio
async def test_compare_with_zero_baseline_has_no_ratio(perf_dir):
    await record("1.0", 0, 0)

    result = await get_server().execute(
        "perf.compare", {"addon": "Demo", "memory_kb": 50, "cpu_ms": 5}
    )

    assert result.success and not result.data.has_regression
    assert result.data.memory_ratio is None and result.data.cpu_ratio is None


@pytest.mark.asyncio
async def test_report_trend_math_limit_and_history_cap(perf_dir):
    await record("1.0", 100, 2)
    await record("1.1", 150, 1)
    await record("1.2", 50, 3)

    result = await get_server().execute("perf.report", {"addon": "Demo", "limit": 2})

    assert result.success
    assert result.data.trend == {
        "memory_change_pct": -50.0,
        "cpu_change_pct": 50.0,
        "first_version": "1.0",
        "latest_version": "1.2",
    }
    assert [m["version"] for m in result.data.history] == ["1.1", "1.2"]
    assert (
        "Memory: -50.0%" in result.data.report and "CPU: +50.0%" in result.data.report
    )

    for n in range(60):
        await record(f"2.{n}", 1, 1, addon="Cap")
    capped = await get_server().execute("perf.report", {"addon": "Cap", "limit": 100})
    assert len(capped.data.history) == 50
    assert capped.data.history[0]["version"] == "2.10"


@pytest.mark.asyncio
async def test_corrupt_baseline_is_reported_and_never_overwritten(perf_dir):
    perf_dir.mkdir(parents=True)
    path = perf_dir / "Demo_baseline.json"
    path.write_text("{not json", encoding="utf-8")

    recorded = await record("1.0", 1, 1)
    compared = await get_server().execute(
        "perf.compare", {"addon": "Demo", "memory_kb": 1, "cpu_ms": 1}
    )

    assert recorded.error.code == "BASELINE_CORRUPT" and recorded.error.suggestion
    assert compared.error.code == "BASELINE_CORRUPT"
    assert path.read_text(encoding="utf-8") == "{not json"

    path.write_text(json.dumps({"history": [{"version": "1"}]}), encoding="utf-8")
    shaped = await get_server().execute("perf.report", {"addon": "Demo"})
    assert shaped.error.code == "BASELINE_CORRUPT"


@pytest.mark.asyncio
async def test_baseline_write_is_atomic_and_leaves_no_temp_files(perf_dir):
    await record("1.0", 1, 1)
    await record("1.1", 2, 2)

    assert sorted(p.name for p in perf_dir.iterdir()) == ["Demo_baseline.json"]
    data = json.loads((perf_dir / "Demo_baseline.json").read_text(encoding="utf-8"))
    assert [m["version"] for m in data["history"]] == ["1.0", "1.1"]
