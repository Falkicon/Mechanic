"""Positive-path and regression tests for the addon.* development commands."""

import json
from pathlib import Path
from types import SimpleNamespace

import pytest

from mechanic import deprecations_builder, setup
from mechanic.commands import development
from mechanic.commands.core import get_server


def proc(returncode=0, stdout="", stderr=""):
    return SimpleNamespace(returncode=returncode, stdout=stdout, stderr=stderr)


@pytest.fixture
def addon(tmp_path):
    root = tmp_path / "Demo"
    root.mkdir()
    (root / "Demo.toc").write_text(
        "## Interface: 120100, 16001\n## Title: Demo\n## Version: 1.0\n"
        "## Notes: n\n## Author: a\n## SavedVariables: DemoDB\n\n"
        "Core.lua\nLibs\\Lib.lua [AllowLoadGameType mainline]\n",
        encoding="utf-8",
    )
    (root / "Core.lua").write_text("GetAddOnInfo(1)\n", encoding="utf-8")
    (root / "Libs").mkdir()
    (root / "Libs" / "Lib.lua").write_text("IsAddOnLoaded('x')\n", encoding="utf-8")
    return root


async def run(command, addon_path, **params):
    return await get_server().execute(
        command, {"addon": "Demo", "path": str(addon_path), **params}
    )


# ── addon.validate ───────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_validate_accepts_current_and_classic_interface_values(addon):
    result = await run("addon.validate", addon)

    assert result.success, result.error
    data = result.data
    assert data.valid, data.errors
    assert data.interface_version == "120100, 16001"
    assert data.file_count == 2
    assert not any("16001" in w for w in data.warnings)  # a current target, no warning
    assert data.errors == []


@pytest.mark.parametrize(
    "interface,fragment",
    [
        ("100207", "outdated"),
        ("12x001", "Invalid Interface value"),
        ("", "Missing ## Interface"),
    ],
)
def test_interface_version_errors(interface, fragment):
    versions = [v for v in interface.split(",") if v]
    errors, _ = development.check_interface_versions(versions)

    assert errors and fragment in errors[0]


def test_interface_version_multi_value_and_known_classic():
    # Stale retail pairs and classic-only lists are outdated: a current target is required.
    for stale in (["120001", "120000"], ["50503"]):
        errors, _ = development.check_interface_versions(stale)
        assert errors and "outdated" in errors[0]
        for version in development.VALID_INTERFACE_VERSIONS:
            assert version in errors[0]
    # Any current target in a multi-client list is enough; known classic values are quiet.
    assert development.check_interface_versions(["100207", "120100"]) == ([], [])
    assert development.check_interface_versions(["11508", "50503", "120100"]) == (
        [],
        [],
    )
    # Unknown five-digit values pass syntactically but warn.
    errors, warnings = development.check_interface_versions(["99999", "16001"])
    assert errors == [] and len(warnings) == 1 and "99999" in warnings[0]


@pytest.mark.asyncio
async def test_validate_reports_missing_files_and_strips_allowload(addon):
    (addon / "Libs" / "Lib.lua").unlink()

    result = await run("addon.validate", addon)

    assert not result.data.valid
    assert result.data.errors == ["Missing files: Libs\\Lib.lua"]


# ── addon.lint ───────────────────────────────────────────────────────────────


@pytest.fixture
def tools(monkeypatch):
    monkeypatch.setattr(setup, "find_tool", lambda name: Path(f"C:/tools/{name}.exe"))
    monkeypatch.setattr(development.shutil, "which", lambda name: None)


@pytest.mark.asyncio
async def test_lint_runs_in_addon_dir_and_parses_issues(addon, tools, monkeypatch):
    seen = {}

    def fake(cmd, **kwargs):
        seen.update(cmd=cmd, cwd=kwargs.get("cwd"), enc=kwargs.get("encoding"))
        return proc(
            1,
            "Core.lua:1:1: (W113) accessing undefined variable 'x'\n"
            "Core.lua:2:5: (E011) expected expression\n",
        )

    monkeypatch.setattr(development.subprocess, "run", fake)
    result = await run("addon.lint", addon)

    assert result.success, result.error
    assert seen["cwd"] == str(addon) and seen["cmd"][1] == "."
    assert seen["enc"] == "utf-8"  # never the locale codepage (cp1252 crashed on Libs)
    assert (result.data.error_count, result.data.warning_count) == (1, 1)
    assert not result.data.passed
    assert result.data.issues[0].code == "W113"


@pytest.mark.parametrize("returncode,stdout", [(3, "bad: I/O error"), (2, "")])
@pytest.mark.asyncio
async def test_lint_tool_failure_is_not_reported_as_clean(
    addon, tools, monkeypatch, returncode, stdout
):
    monkeypatch.setattr(
        development.subprocess, "run", lambda *a, **k: proc(returncode, stdout, "boom")
    )
    result = await run("addon.lint", addon)

    assert not result.success
    assert result.error.code == "LINT_FAILED" and result.error.suggestion


@pytest.mark.asyncio
async def test_lint_clean_run_passes(addon, tools, monkeypatch):
    monkeypatch.setattr(development.subprocess, "run", lambda *a, **k: proc(0, ""))
    result = await run("addon.lint", addon)

    assert result.success and result.data.passed and result.data.issues == []


# ── addon.format ─────────────────────────────────────────────────────────────


@pytest.mark.asyncio
async def test_format_check_handles_paths_with_spaces(addon, tools, monkeypatch):
    diff = (
        "Diff in C:\\Program Files (x86)\\World of Warcraft\\Demo\\Core.lua:\n"
        "1        |-local   x =  1\n    1    |+local x = 1\n"
        "Diff in C:\\Program Files (x86)\\World of Warcraft\\Demo\\Two.lua:\n"
    )
    monkeypatch.setattr(development.subprocess, "run", lambda *a, **k: proc(1, diff))
    result = await run("addon.format", addon, check=True)

    assert result.success, result.error
    assert result.data.unformatted_files == [
        "C:\\Program Files (x86)\\World of Warcraft\\Demo\\Core.lua",
        "C:\\Program Files (x86)\\World of Warcraft\\Demo\\Two.lua",
    ]
    assert result.data.files_changed == 2 and not result.data.formatted


@pytest.mark.asyncio
async def test_format_syntax_error_is_an_error(addon, tools, monkeypatch):
    monkeypatch.setattr(
        development.subprocess,
        "run",
        lambda *a, **k: proc(2, "", "error: could not format file .\\Core.lua: parse"),
    )
    result = await run("addon.format", addon, check=True)

    assert not result.success and result.error.code == "FORMAT_FAILED"
    assert "could not format" in result.error.message


@pytest.mark.asyncio
async def test_format_counts_files_it_changed(addon, tools, monkeypatch):
    def fake(cmd, **kwargs):
        assert kwargs["cwd"] == str(addon) and "--check" not in cmd
        (addon / "Core.lua").write_text(
            "GetAddOnInfo(1) -- formatted\n", encoding="utf-8"
        )
        return proc(0)

    monkeypatch.setattr(development.subprocess, "run", fake)
    result = await run("addon.format", addon)

    assert result.success, result.error
    assert result.data.files_changed == 1 and result.data.formatted
    assert result.data.files_checked == 2


# ── addon.test ───────────────────────────────────────────────────────────────


@pytest.fixture
def specs(addon, tools):
    (addon / "Tests").mkdir()
    (addon / "Tests" / "core_spec.lua").write_text("", encoding="utf-8")
    return addon


@pytest.mark.asyncio
async def test_addon_test_no_specs_is_trivially_passing(addon):
    result = await run("addon.test", addon)

    assert result.success and result.data.passed and result.data.total == 0


@pytest.mark.asyncio
async def test_addon_test_counts_busted_errors_as_failures(specs, monkeypatch):
    report = {
        "successes": [{"name": "works", "duration": 0.1}],
        "failures": [{"name": "asserts", "message": "expected 1"}],
        "errors": [{"name": "throws", "message": "attempt to call nil"}],
    }
    seen = {}

    def fake(cmd, **kwargs):
        seen.update(cmd=cmd, cwd=kwargs["cwd"])
        return proc(1, "some preamble\n" + json.dumps(report))

    monkeypatch.setattr(development.subprocess, "run", fake)
    result = await run("addon.test", specs)

    assert result.success, result.error
    data = result.data
    assert not data.passed
    assert (data.total, data.passed_count, data.failed_count) == (3, 1, 2)
    assert [t.name for t in data.tests[:2]] == ["asserts", "throws"]
    assert data.tests[1].error == "attempt to call nil"
    assert seen["cwd"] == str(specs)


@pytest.mark.asyncio
async def test_addon_test_crash_without_report_fails_with_output(specs, monkeypatch):
    monkeypatch.setattr(
        development.subprocess,
        "run",
        lambda *a, **k: proc(1, "", "lua: Core_spec.lua:3: unexpected symbol"),
    )
    result = await run("addon.test", specs)

    assert result.success, result.error
    assert not result.data.passed and result.data.failed_count == 1
    assert "unexpected symbol" in result.data.error
    assert result.data.tests[0].name == "busted (run failed)"


@pytest.mark.asyncio
async def test_addon_test_nonzero_exit_with_empty_report_still_fails(
    specs, monkeypatch
):
    monkeypatch.setattr(
        development.subprocess,
        "run",
        lambda *a, **k: proc(1, json.dumps({"successes": [], "failures": []}), "oops"),
    )
    result = await run("addon.test", specs)

    assert not result.data.passed and "oops" in result.data.error


@pytest.mark.asyncio
async def test_addon_test_success_and_library_specs_ignored(addon, tools, monkeypatch):
    (addon / "Libs" / "lib_spec.lua").write_text("", encoding="utf-8")
    result = await run("addon.test", addon)
    assert result.data.total == 0  # the only spec lives in Libs

    (addon / "Tests").mkdir()
    (addon / "Tests" / "a_spec.lua").write_text("", encoding="utf-8")
    monkeypatch.setattr(
        development.subprocess,
        "run",
        lambda *a, **k: proc(
            0, json.dumps({"successes": [{"name": "ok"}], "failures": []})
        ),
    )
    result = await run("addon.test", addon)

    assert result.data.passed and result.data.passed_count == 1


@pytest.mark.asyncio
async def test_addon_test_missing_busted_is_actionable(specs, monkeypatch):
    def missing(*a, **k):
        raise FileNotFoundError("busted")

    monkeypatch.setattr(development.subprocess, "run", missing)
    monkeypatch.setattr(setup, "find_tool", lambda name: None)
    result = await run("addon.test", specs)

    assert not result.success
    assert result.error.code == "TOOL_NOT_FOUND" and result.error.suggestion


# ── addon.deprecations ───────────────────────────────────────────────────────


def test_missing_database_uses_fallback_and_says_so(tmp_path, monkeypatch):
    monkeypatch.setattr(development, "resource_path", lambda name: tmp_path / name)

    apis, version, note = development.load_deprecated_apis()

    assert version == "fallback" and len(apis) == 3
    assert "could not be read" in note


@pytest.mark.asyncio
async def test_deprecations_fallback_lowers_confidence_and_warns(
    addon, tmp_path, monkeypatch
):
    monkeypatch.setattr(development, "resource_path", lambda name: tmp_path / name)

    result = await run("addon.deprecations", addon)

    assert result.success, result.error
    assert result.data.database_version == "fallback"
    assert result.confidence < 0.9
    assert result.warnings and result.warnings[0].code == "DEPRECATION_DB_LIMITED"
    assert [i.old_api for i in result.data.issues] == ["GetAddOnInfo"]  # Libs skipped


@pytest.mark.asyncio
async def test_deprecations_with_full_database_and_filters(
    addon, tmp_path, monkeypatch
):
    db = tmp_path / "db"
    db.mkdir()
    (db / "deprecated_apis.json").write_text(
        json.dumps(
            {
                "version": "t-1",
                "apis": [
                    {
                        "old": "GetSpellInfo",
                        "new": "C_Spell.GetSpellInfo",
                        "category": "spells",
                        "severity": "error",
                        "since": "11.0.0",
                    },
                    {
                        "old": "GetAddOnInfo",
                        "new": "C_AddOns.GetAddOnInfo",
                        "category": "addons",
                    },
                ],
            }
        ),
        encoding="utf-8",
    )
    monkeypatch.setattr(development, "resource_path", lambda name: db / name)
    (addon / "Spells.lua").write_text(
        "local a = GetSpellInfo(1)\n"
        "-- GetSpellInfo(2)\n"
        "local b = GetSpellInfo(3) -- @scan-ignore: legacy\n"
        "local c = C_Spell.GetSpellInfo(4)\n"
        "local d = obj:GetSpellInfo(5)\n"
        "local e = GetSpellInfoX(6)\n"
        "local f = GetSpellInfo (7)\n",
        encoding="utf-8",
    )

    everything = await run("addon.deprecations", addon)
    errors_only = await run("addon.deprecations", addon, min_severity="error")
    spells = await run("addon.deprecations", addon, category="spells")

    assert everything.data.database_version == "t-1" and everything.warnings is None
    assert everything.confidence == 0.95
    found = {(i.file, i.line, i.old_api) for i in everything.data.issues}
    assert found == {
        ("Spells.lua", 1, "GetSpellInfo"),
        ("Spells.lua", 7, "GetSpellInfo"),
        ("Core.lua", 1, "GetAddOnInfo"),
    }
    assert everything.data.by_severity == {"error": 2, "warning": 1}
    assert {i.old_api for i in errors_only.data.issues} == {"GetSpellInfo"}
    assert spells.data.by_category == {"spells": 2}


@pytest.mark.asyncio
async def test_deprecations_do_not_skip_addons_inside_a_libs_ancestor(
    tmp_path, monkeypatch
):
    nested = tmp_path / "libs" / "Shared"
    nested.mkdir(parents=True)
    (nested / "Shared.toc").write_text("## Title: S\n", encoding="utf-8")
    (nested / "Core.lua").write_text("LoadAddOn('x')\n", encoding="utf-8")
    (nested / "Libs").mkdir()
    (nested / "Libs" / "Skip.lua").write_text("LoadAddOn('y')\n", encoding="utf-8")
    monkeypatch.setattr(development, "resource_path", lambda name: tmp_path / name)

    result = await get_server().execute(
        "addon.deprecations", {"addon": "Shared", "path": str(nested)}
    )

    assert [(i.file, i.old_api) for i in result.data.issues] == [
        ("Core.lua", "LoadAddOn")
    ]


# ── deprecations_builder ─────────────────────────────────────────────────────

# Trimmed from Blizzard's Blizzard_Deprecated* files (wow-ui-source 11.2.7).
ITEM_SCRIPT = """\
-- These are functions that were deprecated and will be removed in the future.
-- Please upgrade to the updated APIs as soon as possible.

if not GetCVarBool("loadDeprecationFallbacks") then
	return
end

do
	GetItemInfoInstant = C_Item.GetItemInfoInstant
	GetItemIcon = C_Item.GetItemIconByID
	message = SetBasicMessageDialogText
	LOCAL_FLAG = nil
end
"""

DEPRECATED_11_0_2 = """\
-- These are functions that were deprecated in 11.0.2 and will be removed in the next expansion.
-- Please upgrade to the updated APIs as soon as possible.

if not GetCVarBool("loadDeprecationFallbacks") then
	return
end

C_TaskQuest.GetQuestsForPlayerByMapID = C_TaskQuest.GetQuestsOnMap

do
	GetMerchantItemInfo = function(index)
		local info = C_MerchantFrame.GetItemInfo(index)
		if info then
			return info.name,
				info.texture
		end
	end
end

do
	C_MythicPlus.IsWeeklyRewardAvailable = function()
		return false
	end
end

function QuestUtil.IsFrequencyRecurring(frequency)
	return frequency == Enum.QuestFrequency.Daily
		or frequency == Enum.QuestFrequency.Weekly
end

function IsActiveQuestLegendary(questIndex)
	local questID = GetActiveQuestID(questIndex)
	return C_QuestInfoSystem.GetQuestClassification(questID) == Enum.QuestClassification.Legendary
end

function Frame:Method()
	return C_Foo.Bar()
end
"""

DEPRECATED_11_1_7 = """\
-- These are functions that were deprecated in 11.1.7 and will be removed in the next expansion.

function ActionButton_ShowOverlayGlow(button)
	ActionButtonSpellAlertManager:ShowAlert(button)
end

function OneLiner() return C_Foo.Run() end

function AfterOneLiner()
	return C_Foo.After()
end
"""

SPECIALIZATION = """\
-- These are functions that were deprecated and will be removed in the future.

do
	-- Use C_SpecializationInfo.GetSpecialization instead.
	function GetSpecialization(isInspect, isPet, specGroup)
		local legacy = 1
		return legacy
	end
end
"""

GUIDE = """\
--[[
Converted Functions
GetSpellLink(spellID/name) = C_Spell.GetSpellLink(spellIdentifier)
GetSpellLink(index, bookType) = C_SpellBook.GetSpellBookItemLink(index, spellBank)
IsUsableSpell(spellID/name) = C_Spell.IsSpellUsable(spellIdentifier)
]]
"""


def by_old(entries):
    return {e["old"]: e for e in entries}


def test_builder_alias_forms_and_generic_names():
    entries = by_old(
        deprecations_builder.parse_deprecated_lua(
            ITEM_SCRIPT, "Deprecated_ItemScript.lua", "Blizzard_DeprecatedItemScript"
        )
    )

    assert set(entries) == {
        "GetItemInfoInstant",
        "GetItemIcon",
    }  # no `message`, no `= nil`
    assert entries["GetItemIcon"]["new"] == "C_Item.GetItemIconByID"
    assert entries["GetItemIcon"]["category"] == "items"
    assert entries["GetItemIcon"]["since"] == ""  # file states no version


def test_builder_function_forms():
    entries = by_old(
        deprecations_builder.parse_deprecated_lua(
            DEPRECATED_11_0_2, "Deprecated_11_0_2.lua", "Blizzard_Deprecated"
        )
    )

    assert set(entries) == {
        "C_TaskQuest.GetQuestsForPlayerByMapID",
        "GetMerchantItemInfo",
        "C_MythicPlus.IsWeeklyRewardAvailable",
        "QuestUtil.IsFrequencyRecurring",
        "IsActiveQuestLegendary",
    }
    assert entries["GetMerchantItemInfo"]["new"] == "C_MerchantFrame.GetItemInfo"
    assert entries["IsActiveQuestLegendary"]["new"] == (
        "C_QuestInfoSystem.GetQuestClassification"
    )
    assert entries["C_TaskQuest.GetQuestsForPlayerByMapID"]["new"] == (
        "C_TaskQuest.GetQuestsOnMap"
    )
    assert all(e["since"] == "11.0.2" for e in entries.values())
    # no replacement call anywhere in the body: recorded, with an explanatory note
    assert entries["C_MythicPlus.IsWeeklyRewardAvailable"]["new"] == ""
    assert "No direct replacement" in entries["QuestUtil.IsFrequencyRecurring"]["notes"]
    assert "Frame:Method" not in entries  # methods cannot be matched as calls


def test_builder_method_call_one_liners_and_comment_hints():
    entries = by_old(
        deprecations_builder.parse_deprecated_lua(
            DEPRECATED_11_1_7, "Deprecated_11_1_7.lua", "Blizzard_Deprecated"
        )
    )
    assert entries["ActionButton_ShowOverlayGlow"]["new"] == (
        "ActionButtonSpellAlertManager:ShowAlert"
    )
    assert entries["OneLiner"]["new"] == "C_Foo.Run"
    assert entries["AfterOneLiner"]["new"] == "C_Foo.After"

    hinted = by_old(
        deprecations_builder.parse_deprecated_lua(
            SPECIALIZATION,
            "Deprecated_Specialization_Standard.lua",
            "Blizzard_DeprecatedSpecialization",
        )
    )
    assert (
        hinted["GetSpecialization"]["new"] == "C_SpecializationInfo.GetSpecialization"
    )
    assert hinted["GetSpecialization"]["category"] == "specialization"


def test_builder_transition_guide_keeps_first_target_and_notes_overloads():
    entries = by_old(
        deprecations_builder.parse_transition_guide(
            GUIDE, "11_0_0_SpellBookAPITransitionGuide.lua"
        )
    )

    assert entries["GetSpellLink"]["new"] == "C_Spell.GetSpellLink"
    assert "C_SpellBook.GetSpellBookItemLink" in entries["GetSpellLink"]["notes"]
    assert entries["IsUsableSpell"]["since"] == "11.0.0"
    assert entries["IsUsableSpell"]["origin"] == "transition-guide"


def test_build_database_scans_only_deprecated_addons_and_adds_curated(tmp_path):
    addons = tmp_path / "wow-ui-source-live" / "Interface" / "AddOns"
    for folder, name, text in (
        ("Blizzard_Deprecated", "Deprecated_11_0_2.lua", DEPRECATED_11_0_2),
        ("Blizzard_DeprecatedItemScript", "Deprecated_ItemScript.lua", ITEM_SCRIPT),
        ("Blizzard_Deprecated", "11_0_0_SpellBookAPITransitionGuide.lua", GUIDE),
        # same file name outside a Blizzard_Deprecated* folder must be ignored
        (
            "Blizzard_APIDocumentationGenerated",
            "Deprecated_11_0_0Documentation.lua",
            ITEM_SCRIPT,
        ),
    ):
        (addons / folder).mkdir(parents=True, exist_ok=True)
        (addons / folder / name).write_text(text, encoding="utf-8")
    (tmp_path / "wow-ui-source-live" / "version.txt").write_text(
        "11.2.7.64978\n", encoding="utf-8"
    )

    database = deprecations_builder.build_database(tmp_path, "abcdef1234567890")

    assert database["complete"]
    assert database["version"].endswith("+ui-11.2.7.64978+abcdef1234")
    assert database["source"]["ui_version"] == "11.2.7.64978"
    assert "Deprecated_11_0_0Documentation.lua" not in database["source"]["files"]
    assert database["source"]["curated"] == len(deprecations_builder.CURATED) == 4
    apis = by_old(database["apis"])
    assert apis["GetSpellInfo"]["origin"] == "curated"
    assert apis["GetSpellInfo"]["new"] == "C_Spell.GetSpellInfo"
    assert apis["IsUsableSpell"]["origin"] == "transition-guide"
    assert apis["GetItemInfoInstant"]["origin"] == "blizzard-deprecated"
    assert [a["old"] for a in database["apis"]] == sorted(apis)


def test_render_is_one_api_per_line_and_valid_json(tmp_path):
    database = {
        "version": "v",
        "complete": True,
        "source": {"files": []},
        "apis": [{"old": "A", "new": "C_X.A"}, {"old": "B", "new": ""}],
    }

    text = deprecations_builder.render(database)

    assert json.loads(text) == database
    assert '    {"old": "A", "new": "C_X.A"},' in text


def test_bundled_database_is_the_generated_blizzard_list():
    apis, version, note = development.load_deprecated_apis()
    raw = json.loads(
        development.resource_path("deprecated_apis.json").read_text(encoding="utf-8")
    )

    assert version != "fallback" and note is None
    assert raw["complete"] is True and raw["source"]["ui_version"]
    assert len(apis) >= 200
    assert apis["GetSpellInfo"]["new"] == "C_Spell.GetSpellInfo"
    assert apis["IsAddOnLoaded"]["new"] == "C_AddOns.IsAddOnLoaded"
    assert apis["GetItemInfoInstant"]["new"] == "C_Item.GetItemInfoInstant"
    assert "message" not in apis
    assert all(a["old"] and "origin" in a for a in raw["apis"])


@pytest.mark.asyncio
async def test_deprecations_with_bundled_database_end_to_end(addon):
    (addon / "Items.lua").write_text(
        "local a = GetItemInfoInstant(1)\n"
        "local b = C_Item.GetItemInfoInstant(1)\n"
        "local c = GetSpellInfo(2)\n"
        "local d = message('plain local named like a deprecated alias')\n",
        encoding="utf-8",
    )

    result = await run("addon.deprecations", addon, category="items")
    full = await run("addon.deprecations", addon)

    assert result.success, result.error
    assert result.warnings is None and result.confidence == 0.95
    assert result.data.database_version != "fallback"
    assert [(i.file, i.line, i.old_api, i.new_api) for i in result.data.issues] == [
        ("Items.lua", 1, "GetItemInfoInstant", "C_Item.GetItemInfoInstant")
    ]
    found = {(i.file, i.old_api) for i in full.data.issues}
    assert ("Items.lua", "GetSpellInfo") in found
    assert ("Core.lua", "GetAddOnInfo") in found
    assert not any(i.old_api == "message" for i in full.data.issues)
