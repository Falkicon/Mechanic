"""atlas, research and docs command fixes."""

import asyncio
import threading
import time

import pytest

from mechanic.commands import atlas, docs, research
from mechanic.commands.core import get_server

pytestmark = pytest.mark.asyncio


# ─── research ────────────────────────────────────────────────────────────────


@pytest.fixture
def genai_ready(monkeypatch):
    monkeypatch.setattr(research, "get_gemini_api_key", lambda: "test-key")
    monkeypatch.setattr(research, "_check_genai_available", lambda: True)


async def test_research_rejects_unknown_modes_instead_of_echoing_them(genai_ready):
    result = await get_server().execute(
        "research.query", {"query": "x", "mode": "turbo"}
    )

    assert not result.success


async def test_research_blocking_call_runs_off_the_event_loop(genai_ready, monkeypatch):
    main_thread = threading.get_ident()
    seen = []

    def fake(api_key, model, prompt, mode):
        seen.append((threading.get_ident(), model, mode))
        return "answer", ["https://example.invalid/a"]

    monkeypatch.setattr(research, "_generate_grounded", fake)

    result = await get_server().execute(
        "research.query", {"query": "x", "mode": "thinking"}
    )

    assert result.success
    assert result.data.mode == "thinking"
    assert result.data.sources == ["https://example.invalid/a"]
    assert seen[0][0] != main_thread
    assert seen[0][1] == research.SEARCH_MODELS["thinking"]


async def test_research_times_out_instead_of_hanging(genai_ready, monkeypatch):
    monkeypatch.setattr(research, "REQUEST_TIMEOUT_SECONDS", 0.2)
    monkeypatch.setattr(
        research, "_generate_grounded", lambda *args: time.sleep(1) or ("late", [])
    )

    result = await get_server().execute("research.query", {"query": "x"})

    assert not result.success
    assert result.error.code == "SEARCH_TIMEOUT"


async def test_research_model_ids_can_be_overridden_from_the_environment(monkeypatch):
    monkeypatch.setenv("MECHANIC_GEMINI_FAST_MODEL", "custom-flash")
    import importlib

    reloaded = importlib.reload(research)
    try:
        assert reloaded.SEARCH_MODELS["fast"] == "custom-flash"
        assert reloaded.SEARCH_MODELS["thinking"] == reloaded.DEFAULT_MODELS["thinking"]
    finally:
        monkeypatch.delenv("MECHANIC_GEMINI_FAST_MODEL")
        importlib.reload(research)


# ─── atlas ───────────────────────────────────────────────────────────────────


@pytest.mark.parametrize("limit", [0, -1])
async def test_atlas_search_limit_must_be_positive(limit):
    result = await get_server().execute("atlas.search", {"query": "x", "limit": limit})

    assert not result.success


async def test_atlas_scan_runs_off_the_event_loop_and_indexes_atlases(
    tmp_path, monkeypatch
):
    source = tmp_path / "src"
    addon = source / "Interface" / "AddOns" / "Blizzard_ActionBar"
    addon.mkdir(parents=True)
    (addon / "Frame.xml").write_text('<Texture atlas="ui-icon-a"/>', encoding="utf-8")
    (addon / "Code.lua").write_text('tex:SetAtlas("ui-icon-b")', encoding="utf-8")
    threads = []
    real = atlas._scan_atlases

    def spy(*args):
        threads.append(threading.get_ident())
        return real(*args)

    monkeypatch.setattr(atlas, "_scan_atlases", spy)
    out = tmp_path / "atlas.json"

    result = await get_server().execute(
        "atlas.scan", {"source_path": str(source), "output_path": str(out)}
    )

    assert result.success, result.error
    assert result.data.atlas_count == 2
    assert (result.data.xml_count, result.data.lua_count) == (1, 1)
    assert threads and threads[0] != threading.get_ident()


async def test_atlas_index_is_only_read_from_the_data_dir(tmp_path, monkeypatch):
    monkeypatch.setattr(atlas, "get_data_dir", lambda create=False: tmp_path)
    assert atlas._find_atlas_index() is None

    (tmp_path / "atlas_index.json").write_text("{}", encoding="utf-8")
    assert atlas._find_atlas_index() == tmp_path / "atlas_index.json"


# ─── docs ────────────────────────────────────────────────────────────────────


@pytest.mark.parametrize(
    "name,category",
    [
        ("api.search", "API Reference"),
        ("api.refresh", "API Reference"),
        ("sandbox.exec", "Testing"),
        ("lua.queue", "Testing"),
        ("perf.report", "Performance"),
        ("assets.list", "Assets"),
        ("research.query", "Research"),
        ("fencore-search", "FenCore"),
        ("diagnostic.targets", "Core"),
        ("release.all", "Release"),
        ("totally.unknown", "Other"),
    ],
)
async def test_docs_categorises_every_command_family(name, category):
    assert docs.categorize_command(name) == category


async def test_every_registered_command_has_a_real_category():
    server = get_server()

    uncategorised = [
        command.name
        for command in server.list_commands()
        if docs.categorize_command(command.name) == "Other"
    ]

    assert uncategorised == []


async def test_docs_generate_does_not_rewrite_when_only_the_date_changed(
    tmp_path, monkeypatch
):
    out = tmp_path / "cli-reference.md"
    server = get_server()

    monkeypatch.setenv("SOURCE_DATE_EPOCH", "1700000000")
    first = await server.execute("docs.generate", {"output_path": str(out)})
    assert first.success
    original = out.read_text(encoding="utf-8")
    assert "on 2023-11-14" in original

    marker = out.stat().st_mtime_ns
    await asyncio.sleep(0.05)
    monkeypatch.setenv("SOURCE_DATE_EPOCH", "1800000000")
    await server.execute("docs.generate", {"output_path": str(out)})

    assert out.read_text(encoding="utf-8") == original
    assert out.stat().st_mtime_ns == marker
