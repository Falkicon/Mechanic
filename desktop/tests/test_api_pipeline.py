"""Tests for the APIDefs pipeline: path discovery, parser, generator, download hardening."""

import asyncio
import io
import json
import re
import subprocess
import zipfile
from pathlib import Path
from types import SimpleNamespace

import pytest

from mechanic import pipeline_paths
from mechanic.commands import api, apidefs
from mechanic.commands.core import get_server
from mechanic.pipeline_paths import find_lua_exe

REPO_ROOT = Path(__file__).resolve().parents[2]
REAL_APIDEFS = REPO_ROOT / "Mechanic" / "UI" / "APIDefs"


# ─── helpers ─────────────────────────────────────────────────────────────────


def _doc(namespace, functions, doc_type="System"):
    """A Blizzard documentation file with non-tab (4-space) indentation."""
    lines = [
        "local Doc = {",
        '    Name = "Doc",',
        f'    Type = "{doc_type}",',
    ]
    if namespace:
        lines.append(f'    Namespace = "{namespace}",')
    lines.append("    Functions = {")
    for fn in functions:
        lines.append("        {")
        for key, value in fn.items():
            if key in ("Arguments", "Returns"):
                items = ", ".join(
                    '{ Name = "%s", Type = "%s", Nilable = false }' % item
                    for item in value
                )
                lines.append(f"            {key} = {{ {items} }},")
            elif isinstance(value, bool):
                lines.append(f"            {key} = {str(value).lower()},")
            else:
                lines.append(f'            {key} = "{value}",')
        lines.append("        },")
    lines.append("    },")
    lines.append("}")
    lines.append("APIDocumentation:AddDocumentationTable(Doc)")
    return "\n".join(lines) + "\n"


def _make_source(tmp_path, docs, version=None):
    source = tmp_path / "wow-ui-source"
    doc_dir = source / "Interface" / "AddOns" / "Blizzard_APIDocumentationGenerated"
    doc_dir.mkdir(parents=True)
    for name, text in docs.items():
        (doc_dir / f"{name}Documentation.lua").write_text(text, encoding="utf-8")
    if version:
        (source / "version.txt").write_text(version + "\n", encoding="utf-8")
    return source


def _run(coro):
    return asyncio.run(coro)


def _populate(source, db):
    return _run(
        apidefs._api_populate(
            apidefs.APIPopulateInput(source_path=str(source), output_path=str(db))
        )
    )


def _generate(db, out, **kwargs):
    return _run(
        apidefs._api_generate(
            apidefs.APIGenerateInput(
                database_path=str(db), output_path=str(out), **kwargs
            )
        )
    )


SAMPLE_DOCS = {
    "AccountInfo": _doc(
        "C_AccountInfo",
        [
            {
                "Name": "GetIDFromBattleNetAccountGUID",
                "Type": "Function",
                "SecretArguments": "AllowedWhenUntainted",
                "Arguments": [("battleNetAccountGUID", "WOWGUID")],
                "Returns": [("battleNetAccountID", "number")],
            },
            {
                "Name": "Blocked",
                "Type": "Function",
                "SecretArguments": "NotAllowed",
                "Arguments": [("guid", "WOWGUID")],
            },
            {
                "Name": "Tainted",
                "Type": "Function",
                "SecretArguments": "AllowedWhenTainted",
            },
            {"Name": "Hidden", "Type": "Function", "SecretReturns": True},
            {
                "Name": "Sometimes",
                "Type": "Function",
                "SecretWhenInCombat": True,
            },
        ],
    ),
    "SimpleFrame": _doc(
        None,
        [{"Name": "SetPoint", "Type": "Function"}],
        doc_type="ScriptObject",
    ),
    "GlobalThing": _doc(
        None, [{"Name": "DoGlobal", "Type": "Function", "Returns": [("x", "number")]}]
    ),
}


@pytest.fixture
def lua_exe():
    path = find_lua_exe()
    if path is None:
        pytest.skip("no Lua 5.1 executable (set MECHANIC_LUA)")
    return path


def _load_in_lua(lua_exe, apidefs_dir, tmp_path):
    """Execute every file listed in APIDefs.xml and return the number of entries."""
    script = tmp_path / "load_defs.lua"
    script.write_text(
        """
local dir = arg[1]
local ns = { APIDefinitions = {} }
local manifest = assert(io.open(dir .. "/APIDefs.xml", "rb")):read("*a")
local count = 0
for file in manifest:gmatch('<Script file="([^"]+)"') do
    local chunk, err = loadfile(dir .. "/" .. file)
    if not chunk then error(err) end
    chunk("Mechanic", ns)
end
for _ in pairs(ns.APIDefinitions) do count = count + 1 end
print(count)
""",
        encoding="utf-8",
    )
    result = subprocess.run(
        [str(lua_exe), str(script), str(apidefs_dir)],
        capture_output=True,
        text=True,
        encoding="utf-8",
        timeout=120,
    )
    assert result.returncode == 0, result.stderr
    return int(result.stdout.strip())


# ─── repository path discovery ───────────────────────────────────────────────


def test_apidefs_dir_is_derived_from_the_repo_root_not_dev_path(tmp_path, monkeypatch):
    repo = tmp_path / "_dev_" / "Mechanic"
    (repo / "Mechanic").mkdir(parents=True)
    (repo / "Mechanic" / "Mechanic.toc").write_text("## Title: x\n", encoding="utf-8")
    monkeypatch.setattr(
        pipeline_paths,
        "get_config",
        lambda: SimpleNamespace(dev_path=tmp_path / "_dev_"),
    )

    assert pipeline_paths.find_repo_root() == repo
    assert pipeline_paths.get_apidefs_dir() == repo / "Mechanic" / "UI" / "APIDefs"


def test_apidefs_dir_falls_back_to_the_source_checkout(monkeypatch):
    monkeypatch.setattr(
        pipeline_paths, "get_config", lambda: SimpleNamespace(dev_path=None)
    )

    assert pipeline_paths.get_apidefs_dir() == REAL_APIDEFS


def test_canonical_tree_is_consistent_and_root_duplicate_is_gone():
    assert not (REPO_ROOT / "UI").exists(), "root UI/ duplicate must stay removed"
    listed = set(
        re.findall(
            r'<Script file="([^"]+)"', (REAL_APIDEFS / "APIDefs.xml").read_text("utf-8")
        )
    )
    present = {p.name for p in REAL_APIDEFS.glob("*.lua")}
    assert listed == present


def test_canonical_tree_loads_in_lua(lua_exe, tmp_path):
    count = _load_in_lua(lua_exe, REAL_APIDEFS, tmp_path)

    assert count == len(api.parse_lua_table_simple(_read_all(REAL_APIDEFS)))
    assert count > 4000


def _read_all(directory):
    return "\n".join(
        path.read_text(encoding="utf-8") for path in sorted(directory.glob("*.lua"))
    )


# ─── parser ──────────────────────────────────────────────────────────────────


def test_parser_reads_only_top_level_fields_so_params_cannot_rename_the_api():
    apis = api.parse_lua_table_simple(
        (REAL_APIDEFS / "C_AccountInfo.lua").read_text(encoding="utf-8")
    )

    entry = apis["C_AccountInfo.GetIDFromBattleNetAccountGUID"]
    assert entry["name"] == "GetIDFromBattleNetAccountGUID"
    assert entry["params"] == [
        {"name": "battleNetAccountGUID", "type": "WOWGUID", "default": None}
    ]
    assert entry["returns"][0]["name"] == "battleNetAccountID"
    assert "func" not in entry


def test_parser_handles_braces_and_quotes_inside_strings_and_legacy_func():
    content = (
        'APIDefs["C_X.Y"] = {\n'
        '    key = "C_X.Y",\n'
        '    name = "Y",\n'
        '    func = _G["C_X"] and _G["C_X"]["Y"],\n'
        '    params = { { name = "a}b", type = "string \\"q\\"", default = nil } },\n'
        '    midnightNote = "note { with } braces",\n'
        "    protected = true,\n"
        "}\n"
    )

    entry = api.parse_lua_table_simple(content)["C_X.Y"]

    assert entry["name"] == "Y"
    assert entry["protected"] is True
    assert entry["midnightNote"] == "note { with } braces"
    assert entry["params"][0]["name"] == "a}b"
    assert entry["params"][0]["type"] == 'string "q"'
    assert "func" not in entry


@pytest.fixture
def generated_tree(tmp_path, monkeypatch):
    source = _make_source(tmp_path, SAMPLE_DOCS, version="12.0.1.99999")
    db = tmp_path / "db.json"
    assert _populate(source, db).success
    out = tmp_path / "Mechanic" / "UI" / "APIDefs"
    assert _generate(db, out).success
    monkeypatch.setattr(api, "get_apidefs_path", lambda: out)
    return out


@pytest.mark.asyncio
async def test_search_info_list_and_wildcard_use_the_correct_names(generated_tree):
    server = get_server()

    found = await server.execute("api.search", {"query": "GetIDFrom*Account*"})
    info = await server.execute(
        "api.info", {"api_name": "c_accountinfo.getidfrombattlenetaccountguid"}
    )
    listed = await server.execute("api.list", {"namespace": "C_AccountInfo"})
    missing = await server.execute("api.search", {"query": "NoSuchApiAnywhere"})

    assert [item["key"] for item in found.data.apis] == [
        "C_AccountInfo.GetIDFromBattleNetAccountGUID"
    ]
    assert info.data.found
    assert info.data.api["name"] == "GetIDFromBattleNetAccountGUID"
    assert info.data.api["signature"].startswith("(battleNetAccountGUID: WOWGUID)")
    names = {item["key"]: item["name"] for item in listed.data.apis}
    assert names["C_AccountInfo.Blocked"] == "Blocked"
    assert names["C_AccountInfo.Hidden"] == "Hidden"
    assert missing.success and missing.data.total == 0


@pytest.mark.asyncio
async def test_api_info_does_not_mutate_the_shared_cache(generated_tree):
    server = get_server()
    await server.execute("api.info", {"api_name": "C_AccountInfo.Blocked"})

    cached = api.load_all_apis()["C_AccountInfo.Blocked"]
    assert "signature" not in cached


def test_load_all_apis_is_cached_until_a_file_changes(generated_tree, monkeypatch):
    calls = []
    real = api.parse_lua_table_simple

    def counting(content):
        calls.append(1)
        return real(content)

    monkeypatch.setattr(api, "parse_lua_table_simple", counting)
    first = api.load_all_apis()
    parsed_once = len(calls)
    assert api.load_all_apis() is first
    assert len(calls) == parsed_once

    target = generated_tree / "C_AccountInfo.lua"
    target.write_text(
        target.read_text(encoding="utf-8").replace(
            'name = "Blocked"', 'name = "BlockedRenamed"'
        ),
        encoding="utf-8",
    )
    second = api.load_all_apis()

    assert len(calls) > parsed_once
    assert second["C_AccountInfo.Blocked"]["name"] == "BlockedRenamed"


@pytest.mark.asyncio
async def test_load_all_apis_runs_off_the_event_loop(generated_tree, monkeypatch):
    import threading

    main_thread = threading.get_ident()
    seen = []
    real = api.load_all_apis

    def spy():
        seen.append(threading.get_ident())
        return real()

    monkeypatch.setattr(api, "load_all_apis", spy)
    await get_server().execute("api.stats", {})

    assert seen and all(ident != main_thread for ident in seen)


# ─── generator ───────────────────────────────────────────────────────────────


def test_populate_classifies_secret_arguments_by_value(tmp_path):
    source = _make_source(tmp_path, SAMPLE_DOCS, version="12.0.1.99999")
    db = tmp_path / "db.json"

    result = _populate(source, db)

    assert result.success
    assert result.data.wow_version == "12.0.1.99999"
    apis = json.loads(db.read_text(encoding="utf-8"))["apis"]
    impact = {
        key.split(".")[-1]: value["midnightImpact"] for key, value in apis.items()
    }
    assert impact == {
        "GetIDFromBattleNetAccountGUID": "NORMAL",  # AllowedWhenUntainted
        "Blocked": "RESTRICTED",  # NotAllowed
        "Tainted": "NORMAL",  # AllowedWhenTainted
        "Hidden": "HIGH",
        "Sometimes": "CONDITIONAL",
        "DoGlobal": "NORMAL",
    }
    assert "SetPoint" not in impact  # widget methods are not global APIs


def test_generated_lua_marks_only_not_allowed_as_protected_and_has_no_eager_func(
    generated_tree,
):
    apis = api.load_all_apis()

    assert apis["C_AccountInfo.Blocked"]["protected"] is True
    assert apis["C_AccountInfo.Blocked"]["midnightImpact"] == "RESTRICTED"
    assert not apis["C_AccountInfo.GetIDFromBattleNetAccountGUID"].get("protected")
    for path in generated_tree.glob("*.lua"):
        assert "func = _G" not in path.read_text(encoding="utf-8")
    assert apis["DoGlobal"]["subcategory"] == "global"


def test_generated_tree_loads_in_lua_and_manifest_lists_every_file(
    generated_tree, lua_exe, tmp_path
):
    assert _load_in_lua(lua_exe, generated_tree, tmp_path) == 6
    listed = set(
        re.findall(
            r'<Script file="([^"]+)"',
            (generated_tree / "APIDefs.xml").read_text(encoding="utf-8"),
        )
    )
    assert listed == {p.name for p in generated_tree.glob("*.lua")}


def test_generator_escapes_hostile_strings_and_sanitises_namespaces(tmp_path, lua_exe):
    db = tmp_path / "db.json"
    hostile = 'Evil"]=1 os.execute("x") --'
    db.write_text(
        json.dumps(
            {
                "apis": {
                    "../../Bad.Name": {
                        "namespace": "../../Bad",
                        "name": hostile,
                        "category": "general",
                        "params": [
                            {"name": hostile, "type": 'T"\\', "default": 'd"\n'}
                        ],
                        "returns": [{"name": "r", "type": "number"}],
                        "secretFlags": {"SecretArguments": 'Not"Allowed'},
                        "midnightImpact": "NORMAL",
                    }
                }
            }
        ),
        encoding="utf-8",
    )
    out = tmp_path / "APIDefs"

    result = _generate(db, out)

    assert result.success
    assert sorted(p.name for p in out.iterdir()) == ["APIDefs.xml", "______Bad.lua"]
    assert not (tmp_path.parent / "Bad.lua").exists()
    assert _load_in_lua(lua_exe, out, tmp_path) == 1
    entry = api.parse_lua_table_simple((out / "______Bad.lua").read_text("utf-8"))[
        "../../Bad.Name"
    ]
    assert entry["name"] == hostile
    assert entry["params"][0]["default"] == 'd"\n'


def test_generate_refuses_directories_not_named_apidefs(tmp_path):
    db = tmp_path / "db.json"
    db.write_text(json.dumps({"apis": {}}), encoding="utf-8")
    precious = tmp_path / "precious"
    precious.mkdir()
    (precious / "keep.lua").write_text("return 1", encoding="utf-8")

    result = _generate(db, precious)

    assert not result.success and result.error.code == "INVALID_OUTPUT_PATH"
    assert (precious / "keep.lua").exists()
    assert _generate(db, precious, allow_any_output_dir=True).success


def test_generate_replaces_generated_files_but_keeps_unrelated_ones(tmp_path):
    db = tmp_path / "db.json"
    db.write_text(
        json.dumps(
            {
                "apis": {
                    "C_New.Fn": {
                        "namespace": "C_New",
                        "name": "Fn",
                        "category": "general",
                        "params": [],
                        "returns": [],
                        "secretFlags": {},
                        "midnightImpact": "NORMAL",
                    }
                }
            }
        ),
        encoding="utf-8",
    )
    out = tmp_path / "APIDefs"
    out.mkdir()
    (out / "C_Stale.lua").write_text("-- stale", encoding="utf-8")
    (out / "README.txt").write_text("keep", encoding="utf-8")

    assert _generate(db, out).success

    assert not (out / "C_Stale.lua").exists()
    assert (out / "README.txt").read_text(encoding="utf-8") == "keep"
    assert (out / "C_New.lua").exists()
    assert not [p for p in tmp_path.iterdir() if p.name.startswith(".apidefs-")]


def test_generated_files_use_lf_line_endings(generated_tree):
    assert b"\r" not in (generated_tree / "C_AccountInfo.lua").read_bytes()


# ─── python fallback parser ──────────────────────────────────────────────────


def test_python_fallback_matches_lua_dumper_for_non_tab_indentation(tmp_path, lua_exe):
    source = _make_source(tmp_path, SAMPLE_DOCS)
    doc = next((source / "Interface" / "AddOns").rglob("AccountInfoDocumentation.lua"))

    via_lua, lua_error = apidefs._parse_blizzard_file(
        lua_exe, apidefs._get_lua_dumper(), doc
    )
    via_python, python_error = apidefs._parse_blizzard_file(None, None, doc)

    assert lua_error is None and python_error is None
    assert via_python == via_lua
    assert [f["Name"] for f in via_python["Functions"]][:2] == [
        "GetIDFromBattleNetAccountGUID",
        "Blocked",
    ]


def test_python_fallback_reports_unparseable_files_instead_of_guessing(tmp_path):
    bad = tmp_path / "BrokenDocumentation.lua"
    bad.write_text("local Doc = { Name = \n", encoding="utf-8")

    data, problem = apidefs._parse_blizzard_file(None, None, bad)

    assert data is None and "BrokenDocumentation.lua" in problem


def test_populate_reports_unparseable_files(tmp_path, monkeypatch):
    monkeypatch.setattr(apidefs, "_get_lua_exe", lambda: None)
    source = _make_source(tmp_path, {"Broken": "local Doc = { Name = \n"})

    result = _populate(source, tmp_path / "db.json")

    assert result.success
    assert len(result.data.skipped_files) == 1


def test_python_parser_evaluates_expressions_as_opaque_values():
    parsed = apidefs.parse_lua_table_literal(
        'local X = { A = Enum.Foo.Bar, B = { 1, 2, -3 }, C = 4 + 5, D = "s" }'
    )

    assert parsed["B"] == [1, 2, -3]
    assert parsed["D"] == "s"
    assert parsed["A"].startswith("expr:")
    assert parsed["C"].startswith("expr:")


# ─── download hardening ──────────────────────────────────────────────────────


@pytest.mark.parametrize("build_id", ["../x", "64889/../../etc", "abc", "", "12"])
def test_download_rejects_invalid_build_ids(build_id):
    result = _run(apidefs._api_download(apidefs.APIDownloadInput(build_id=build_id)))

    assert not result.success
    assert result.error.code in ("INVALID_BUILD_ID", "BUILD_ID_REQUIRED")


@pytest.mark.parametrize(
    "header,expected",
    [
        ('attachment; filename="12.0.1.64889.zip"', "12.0.1.64889"),
        ("attachment; filename=../../evil.zip", "build_64889"),
        ('attachment; filename="..\\\\..\\\\12.0.1.1.zip"', "12.0.1.1"),
        ("attachment; filename*=UTF-8''12.0.1.64889.zip", "12.0.1.64889"),
        ("", "build_64889"),
    ],
)
def test_download_version_comes_only_from_a_version_shaped_filename(header, expected):
    headers = {"Content-Disposition": header} if header else {}

    assert apidefs._version_from_headers(headers, "64889") == expected


class _FakeResponse:
    def __init__(self, payload, headers=None):
        self.payload = payload
        self.headers = headers or {}

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        return False

    def raise_for_status(self):
        pass

    def iter_content(self, chunk_size=1):
        for index in range(0, len(self.payload), chunk_size):
            yield self.payload[index : index + chunk_size]


def test_download_caps_the_body_size(monkeypatch):
    monkeypatch.setattr(apidefs, "MAX_DOWNLOAD_BYTES", 10)
    monkeypatch.setattr(
        apidefs.requests, "get", lambda *a, **k: _FakeResponse(b"x" * 100)
    )

    with pytest.raises(ValueError):
        apidefs._download_zip("https://example.invalid/zip")

    monkeypatch.setattr(
        apidefs.requests,
        "get",
        lambda *a, **k: _FakeResponse(b"x", {"Content-Length": "100"}),
    )
    with pytest.raises(ValueError):
        apidefs._download_zip("https://example.invalid/zip")


def _zip_bytes(members):
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w") as archive:
        for name, data in members.items():
            archive.writestr(name, data)
    return buffer.getvalue()


def test_extraction_blocks_traversal_and_oversized_archives(tmp_path, monkeypatch):
    with pytest.raises(ValueError):
        apidefs._extract_zip_bytes(_zip_bytes({"../evil.txt": b"x"}), tmp_path / "a")
    assert not (tmp_path / "evil.txt").exists()

    monkeypatch.setattr(apidefs, "MAX_EXTRACTED_BYTES", 5)
    with pytest.raises(ValueError):
        apidefs._extract_zip_bytes(_zip_bytes({"big.txt": b"x" * 50}), tmp_path / "b")

    monkeypatch.setattr(apidefs, "MAX_EXTRACTED_BYTES", 1000)
    count = apidefs._extract_zip_bytes(_zip_bytes({"ok/f.txt": b"x"}), tmp_path / "c")
    assert count == 1 and (tmp_path / "c" / "ok" / "f.txt").exists()


def test_download_extracts_into_the_data_dir_by_default(tmp_path, monkeypatch):
    payload = _zip_bytes(
        {
            "Blizzard_APIDocumentationGenerated/AccountInfoDocumentation.lua": SAMPLE_DOCS[
                "AccountInfo"
            ]
        }
    )
    monkeypatch.setattr(
        apidefs.requests,
        "get",
        lambda *a, **k: _FakeResponse(
            payload, {"Content-Disposition": 'attachment; filename="12.0.1.5.zip"'}
        ),
    )
    monkeypatch.setattr(
        apidefs, "get_config", lambda: SimpleNamespace(data_dir=tmp_path / "data")
    )

    result = _run(
        apidefs._api_download(apidefs.APIDownloadInput(build_id="12345", refresh=False))
    )

    assert result.success
    assert Path(result.data.output_path) == tmp_path / "data" / "framexml" / "12.0.1.5"
    assert result.data.version == "12.0.1.5"
