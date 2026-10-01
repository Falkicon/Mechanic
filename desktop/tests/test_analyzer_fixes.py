"""
Regression tests for the tokenizer-based analyzers: each detector has a
false-positive case (code that must NOT be reported) next to a true positive.
"""

from pathlib import Path


from mechanic.analysis_common import (
    SourceCache,
    find_main_toc,
    finalize_issues,
    iter_lua_files,
)
from mechanic.commands.complexity import (
    ComplexityInput,
    analyze_nesting_depth,
    find_deep_nesting,
    find_duplicate_code,
    find_long_functions,
    find_magic_numbers,
)
from mechanic.commands import complexity as complexity_cmd
from mechanic.commands.deadcode import (
    DeadCodeCategory,
    DeadCodeInput,
    analyze_addon as analyze_deadcode,
    find_commented_code_blocks,
    find_dead_exports,
    find_orphaned_files,
    find_unreachable_code,
    find_unused_libraries,
    find_unused_locale_strings,
)
from mechanic.commands.security import (
    PROTECTED_APIS,
    SecurityInput,
    analyze_addon as analyze_security,
    find_addon_comm_issues,
    find_combat_violations,
    find_secret_leaks,
    find_taint_risks,
    find_unsafe_eval,
)
from mechanic.lua_analyzer import Confidence, LuaAnalyzer


def write(tmp_path: Path, name: str, content: str) -> Path:
    path = tmp_path / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return path


def analyze(code: str, name: str = "Addon") -> LuaAnalyzer:
    analyzer = LuaAnalyzer(name)
    analyzer.analyze_file(Path("test.lua"), code)
    return analyzer


def unused_functions(code: str, name: str = "Addon") -> dict:
    return {f.name: c for f, c in analyze(code, name).get_unused_functions()}


def unused_variables(code: str) -> set:
    return {v.name for v, _ in analyze(code).get_unused_variables()}


# ═══════════════════════════════════════════════════════════════════════════════
# Shared walker and result helpers
# ═══════════════════════════════════════════════════════════════════════════════


class TestSharedHelpers:
    def test_libs_excluded_case_insensitively_from_relative_path(self, tmp_path):
        addon = tmp_path / "MyLibs" / "Addon"  # parent name must not matter
        write(addon, "Core.lua", "x = 1")
        write(addon, "Libs/LibStub/LibStub.lua", "x = 1")
        write(addon, "LIBS/Other.lua", "x = 1")
        write(addon, "lib/Third.lua", "x = 1")
        write(addon, "UI/Panel.lua", "x = 1")
        write(addon, ".git/hooks/hook.lua", "x = 1")
        found = [p.relative_to(addon).as_posix() for p in iter_lua_files(addon)]
        assert found == ["Core.lua", "UI/Panel.lua"]
        with_libs = iter_lua_files(addon, include_libs=True)
        assert len(with_libs) == 5  # hidden directories are still skipped

    def test_source_cache_reads_each_file_once_and_reports_errors(self, tmp_path):
        good = write(tmp_path, "a.lua", "local x = 1")
        missing = tmp_path / "missing.lua"
        cache = SourceCache(tmp_path)
        assert cache.parse(good) is cache.parse(good)
        assert cache.read(missing) is None
        assert cache.readable([good, missing]) == [good]
        assert len(cache.errors) == 1 and "missing.lua" in cache.errors[0]

    def test_finalize_sorts_by_severity_before_truncating(self):
        class Issue:
            def __init__(self, category, confidence, line):
                self.category, self.confidence = category, confidence
                self.file, self.line = "f.lua", line

        issues = [Issue("b", "suspicious", i) for i in range(5)] + [
            Issue("a", "definite", 99)
        ]
        kept, truncated, total = finalize_issues(issues, 2)
        assert total == 6 and truncated is True
        assert kept[0].confidence == "definite"

    def test_main_toc_prefers_addon_name(self, tmp_path):
        write(tmp_path, "Other.toc", "## Title: x")
        write(tmp_path, "Addon.toc", "## Title: x")
        assert find_main_toc(tmp_path, "Addon").name == "Addon.toc"
        assert find_main_toc(tmp_path, "!Addon").name == "Addon.toc"


# ═══════════════════════════════════════════════════════════════════════════════
# Complexity
# ═══════════════════════════════════════════════════════════════════════════════


class TestComplexityFixes:
    def test_single_line_returns_do_not_drift(self, tmp_path):
        body = "    if not x then return end\n" * 5
        src = f"local function f(x)\n{body}    print(x)\nend\n"
        info = analyze_nesting_depth(src)
        assert max(depth for _, depth, _ in info) == 1
        lua = write(tmp_path, "Core.lua", src)
        assert find_deep_nesting(tmp_path, [lua], max_depth=1) == []

    def test_depth_is_exact_and_reported_once(self, tmp_path):
        src = "function F()\n"
        for level in range(6):
            src += f"{'  ' * level}if c{level} then\n"
        src += "print(1)\n" + "end\n" * 6 + "end\n"
        assert max(d for _, d, _ in analyze_nesting_depth(src)) == 6
        lua = write(tmp_path, "Core.lua", src)
        issues = find_deep_nesting(tmp_path, [lua], max_depth=5)
        assert len(issues) == 1 and issues[0].value == 6
        assert find_deep_nesting(tmp_path, [lua], max_depth=6) == []

    def test_keywords_in_strings_and_comments_do_not_nest(self, tmp_path):
        src = 'local s = "if x then"\n-- if y then\nlocal t = [[ if z then ]]\n'
        assert max(d for _, d, _ in analyze_nesting_depth(src)) == 0

    def test_long_function_with_inner_blocks_is_found(self, tmp_path):
        body = "".join(f"    local v{i} = {i}\n" for i in range(150))
        src = f"function Long()\n    if a then\n        b()\n    end\n{body}end\n"
        lua = write(tmp_path, "Core.lua", src)
        issues = find_long_functions(tmp_path, [lua], max_lines=100)
        assert len(issues) == 1
        assert issues[0].name == "Long" and issues[0].value >= 150

    def test_long_function_length_stops_at_its_own_end(self, tmp_path):
        body = "    local x = 1\n" * 10
        src = f"function Short()\n    if a then\n    end\n{body}end\n" + "y = 1\n" * 500
        lua = write(tmp_path, "Core.lua", src)
        assert find_long_functions(tmp_path, [lua], max_lines=50) == []

    def test_assigned_functions_are_named(self, tmp_path):
        body = "    local x = 1\n" * 30
        src = f"local Addon = {{}}\nAddon.Handler = function()\n{body}end\n"
        lua = write(tmp_path, "Core.lua", src)
        issues = find_long_functions(tmp_path, [lua], max_lines=10)
        assert [i.name for i in issues] == ["Addon.Handler"]

    def test_magic_numbers_ignore_strings_comments_hex_and_constants(self, tmp_path):
        src = (
            'local s = "level 42 boss" -- 77 here\n'
            "local MASK = 0xFF00 + 4096\n"
            "local DEFAULTS = {\n  size = 37,\n  nested = { 91 },\n}\n"
            "local t = items[42]\n"
            "local seconds = 3600\n"
            "frame:SetPoint('TOP', 0, -25)\n"
        )
        lua = write(tmp_path, "Core.lua", src)
        found = {i.name for i in find_magic_numbers(tmp_path, [lua])}
        assert found == {"Number 25"}

    def test_duplicate_blocks_merge_into_one_issue(self, tmp_path):
        block = "".join(
            f"local value{i} = compute({i * 3}, 'x{i}')\n" for i in range(30)
        )
        a = write(tmp_path, "A.lua", "-- header a\n" + block)
        b = write(tmp_path, "B.lua", block + "-- trailing\n")
        issues = find_duplicate_code(tmp_path, [a, b])
        assert len(issues) == 1
        assert "30 lines duplicated" in issues[0].message

    def test_duplicate_detection_ignores_comments_and_boilerplate(self, tmp_path):
        a = write(tmp_path, "A.lua", "end\n" * 40)
        b = write(tmp_path, "B.lua", "end\n" * 40)
        assert find_duplicate_code(tmp_path, [a, b]) == []

    def test_analyze_addon_truncates_by_severity_and_reports_counts(self, tmp_path):
        write(
            tmp_path,
            "Core.lua",
            "\n".join(f"local x{i} = {i + 100}" for i in range(50)),
        )
        long_lines = "x = 1\n" * 600
        write(tmp_path, "Big.lua", long_lines)
        result = complexity_cmd.analyze_addon(
            tmp_path, "Addon", ComplexityInput(addon="Addon", limit=3)
        )
        assert result.truncated is True
        assert result.total_issues == result.summary.total > 3
        assert len(result.issues) == 3
        assert (
            result.issues[0].confidence == "definite"
        )  # long_file beats magic numbers
        assert (
            result.summary.by_category["magic_number"] == 48
        )  # 100 and 128 are acceptable


# ═══════════════════════════════════════════════════════════════════════════════
# Dead code
# ═══════════════════════════════════════════════════════════════════════════════


class TestUnreachableFixes:
    def run(self, tmp_path, code):
        lua = write(tmp_path, "Core.lua", code)
        return find_unreachable_code(tmp_path, [lua])

    def test_if_return_else_is_not_unreachable(self, tmp_path):
        code = "local function f(x)\n if x then\n  return 1\n else\n  return 2\n end\nend\n"
        assert self.run(tmp_path, code) == []

    def test_single_line_return_guard_followed_by_code(self, tmp_path):
        code = "local function f(x)\n  if not x then return end\n  print(x)\nend\n"
        assert self.run(tmp_path, code) == []

    def test_multiline_return_table_is_not_followed_by_statements(self, tmp_path):
        code = "local function f()\n  return {\n    a = 1,\n    b = 2,\n  }\nend\n"
        assert self.run(tmp_path, code) == []

    def test_do_return_end_idiom(self, tmp_path):
        code = "local function f()\n  do return end\n  x = 1\nend\n"
        assert self.run(tmp_path, code) == []

    def test_code_after_return_is_reported_once(self, tmp_path):
        code = "local function f()\n  return 1\n  print('a')\n  print('b')\nend\n"
        issues = self.run(tmp_path, code)
        assert [i.line for i in issues] == [3]

    def test_code_after_break_is_reported(self, tmp_path):
        issues = self.run(tmp_path, "while true do\n  break\n  x = 1\nend\n")
        assert [i.line for i in issues] == [3]

    def test_return_inside_string_or_comment_is_ignored(self, tmp_path):
        code = "local s = 'return'\n-- return\nprint(s)\n"
        assert self.run(tmp_path, code) == []


class TestReferenceCounting:
    def test_function_passed_as_value_is_used(self):
        code = (
            "local function cmp(a, b) return a < b end\n"
            "table.sort(list, cmp)\n"
            "local function inTable() end\n"
            "local handlers = { PLAYER_LOGIN = inTable }\n"
            "local function hook() end\n"
            'hooksecurefunc("Foo", hook)\n'
            "local function ev() end\n"
            'Addon:RegisterMessage("X", ev)\n'
            "return handlers\n"
        )
        assert unused_functions(code) == {}

    def test_unused_local_function_is_definite(self):
        assert unused_functions("local function dead() end\n") == {
            "dead": Confidence.DEFINITE
        }

    def test_recursion_does_not_count_as_use(self):
        code = "local function loop(n)\n  return loop(n - 1)\nend\n"
        assert list(unused_functions(code)) == ["loop"]

    def test_method_calls_count_as_use(self):
        code = (
            "function Addon:Used() end\n"
            "function Addon:Caller()\n  self:Used()\nend\n"
            "Addon:Caller()\n"
        )
        assert unused_functions(code) == {}

    def test_definition_site_is_not_a_use(self):
        assert "Addon:Lonely" in unused_functions("function Addon:Lonely() end\n")
        assert "Addon.Lonely" in unused_functions("function Addon.Lonely() end\n")
        assert "Addon.Field" in unused_functions("Addon.Field = function() end\n")

    def test_string_dispatch_counts_as_use(self):
        code = (
            "function Addon:OnX() end\n"
            "function Addon:Slash() end\n"
            "function Addon:Tick() end\n"
            'Addon:RegisterMessage("X", "OnX")\n'
            'Addon:RegisterChatCommand("c", "Slash")\n'
            'Addon:ScheduleTimer("Tick", 1)\n'
        )
        assert unused_functions(code) == {}

    def test_acE_event_defaults_to_method_named_after_event(self):
        code = (
            "function Addon:PLAYER_LOGIN() end\nAddon:RegisterEvent('PLAYER_LOGIN')\n"
        )
        assert unused_functions(code) == {}

    def test_global_function_used_via_G_string(self):
        code = 'function Helper() end\nlocal f = _G["Helper"]\n'
        assert unused_functions(code) == {}

    def test_dynamic_global_lookup_lowers_confidence(self):
        code = "function Maybe() end\nlocal name = 'x'\nlocal f = _G[name .. 'y']\n"
        assert unused_functions(code) == {"Maybe": Confidence.SUSPICIOUS}

    def test_string_equal_to_name_lowers_confidence(self):
        code = "function Maybe() end\nlocal k = 'Maybe'\n"
        assert unused_functions(code) == {"Maybe": Confidence.SUSPICIOUS}

    def test_lifecycle_methods_are_safe(self):
        code = "function Addon:OnInitialize() end\nfunction Addon:OnEnable() end\n"
        assert unused_functions(code) == {}

    def test_global_function_used_across_files(self):
        analyzer = LuaAnalyzer("Addon")
        analyzer.analyze_file(Path("a.lua"), "function Shared() end\n")
        analyzer.analyze_file(Path("b.lua"), "Shared()\n")
        assert analyzer.get_unused_functions() == []

    def test_xml_style_external_reference(self):
        analyzer = LuaAnalyzer("Addon")
        analyzer.analyze_file(Path("a.lua"), "function Addon_OnLoad() end\n")
        analyzer.add_external_references({"Addon_OnLoad"})
        assert analyzer.get_unused_functions() == []


class TestUnusedLocals:
    def test_variable_read_as_value_is_used(self):
        code = "local count = 5\nprint(count)\nlocal name = 'x'\nreturn name\n"
        assert unused_variables(code) == set()

    def test_unused_and_write_only_locals_are_reported(self):
        code = "local dead = 1\nlocal written = 1\nwritten = 2\n"
        assert unused_variables(code) == {"dead", "written"}

    def test_constructor_key_is_not_a_read(self):
        assert unused_variables(
            "local count = 1\nlocal t = { count = 2 }\nreturn t\n"
        ) == {"count"}

    def test_partial_destructuring_is_not_reported(self):
        code = "local ok, err = pcall(f)\nif not ok then print(err) end\n"
        assert unused_variables(code) == set()

    def test_underscore_and_scoped_shadowing(self):
        code = "local _unused = 1\ndo\n  local inner = 1\nend\nprint(inner)\n"
        assert unused_variables(code) == {"inner"}

    def test_loop_variables_and_parameters_are_not_locals(self):
        code = "for i = 1, 3 do end\nfor k, v in pairs(t) do end\nlocal function f(a, b) end\nf()\n"
        assert unused_variables(code) == set()


class TestDeadExports:
    def make(self, tmp_path, files):
        analyzer = LuaAnalyzer("Addon")
        for name, code in files.items():
            analyzer.analyze_file(write(tmp_path, name, code), code)
        return find_dead_exports(analyzer, tmp_path, "Addon")

    def test_method_called_with_self_elsewhere_is_not_dead(self, tmp_path):
        files = {
            "a.lua": "function Addon:Helper() end\n",
            "b.lua": "function Addon:Run()\n  self:Helper()\nend\n",
        }
        assert self.make(tmp_path, files) == []

    def test_export_only_used_in_own_file_is_reported(self, tmp_path):
        files = {
            "a.lua": "function Addon.Local() end\nfunction Addon:Run()\n  Addon.Local()\nend\n"
        }
        issues = self.make(tmp_path, files)
        assert [i.name for i in issues] == ["Addon.Local"]
        assert issues[0].confidence == Confidence.LIKELY.value

    def test_never_referenced_export_is_left_to_unused_function(self, tmp_path):
        assert self.make(tmp_path, {"a.lua": "function Addon:Nobody() end\n"}) == []


class TestLibrariesAndLocales:
    def test_mixin_libraries_and_dependencies_are_used(self, tmp_path):
        addon = tmp_path / "Addon"
        write(
            addon,
            "Core.lua",
            'LibStub("AceAddon-3.0"):NewAddon("Addon", "AceEvent-3.0")\n',
        )
        write(
            addon,
            "libs.json",
            '{"include": {"AceAddon-3.0": {}, "AceEvent-3.0": {}, '
            '"CallbackHandler-1.0": {}, "AceDB-3.0": {}, "FenUI": {}}}',
        )
        write(
            addon,
            "Libs/AceEvent-3.0/AceEvent-3.0.lua",
            'local CH = LibStub("CallbackHandler-1.0")\n',
        )
        write(addon, "Libs/AceDB-3.0/AceDB-3.0.lua", "x = 1\n")
        analyzer = LuaAnalyzer("Addon")
        code = (addon / "Core.lua").read_text()
        analyzer.analyze_file(addon / "Core.lua", code)
        analyzer.analyze_file(addon / "Other.lua", "FenUI.Do()\n")
        issues = find_unused_libraries(addon, "Addon", analyzer)
        assert [i.name for i in issues] == ["AceDB-3.0"]

    def locale_setup(self, tmp_path, code):
        addon = tmp_path / "Addon"
        write(
            addon,
            "Locales/enUS.lua",
            'L["Used"] = "a"\nL["Dead"] = "b"\nL["PREFIX_X"] = "c"\n',
        )
        analyzer = LuaAnalyzer("Addon")
        analyzer.analyze_file(write(addon, "Core.lua", code), code)
        return find_unused_locale_strings(addon, analyzer)

    def test_static_unused_locale_is_definite_with_line(self, tmp_path):
        issues = self.locale_setup(tmp_path, 'print(L["Used"], L["PREFIX_X"])\n')
        assert [(i.name, i.confidence, i.line) for i in issues] == [
            ('L["Dead"]', "definite", 2)
        ]

    def test_dynamic_locale_lookup_is_not_definite(self, tmp_path):
        issues = self.locale_setup(tmp_path, 'print(L["Used"], L[key])\n')
        assert {i.confidence for i in issues} == {"suspicious"}
        assert {i.name for i in issues} == {'L["Dead"]', 'L["PREFIX_X"]'}

    def test_dynamic_prefix_covers_matching_keys(self, tmp_path):
        issues = self.locale_setup(tmp_path, 'print(L["Used"], L["PREFIX_" .. kind])\n')
        assert [i.name for i in issues] == ['L["Dead"]']


class TestOrphansAndCommentedCode:
    def addon(self, tmp_path, toc_files="Core.lua"):
        addon = tmp_path / "Addon"
        write(addon, "Addon.toc", f"## Title: Addon\n{toc_files}\n")
        write(addon, "Core.lua", "x = 1")
        return addon

    def test_test_skip_uses_directories_and_suffixes_not_substrings(self, tmp_path):
        addon = self.addon(tmp_path)
        write(addon, "Latest.lua", "x = 1")
        write(addon, "Contest.lua", "x = 1")
        write(addon, "Tests/Helper.lua", "x = 1")
        write(addon, "Core_spec.lua", "x = 1")
        write(addon, "Thing_test.lua", "x = 1")
        orphans = sorted(i.file for i in find_orphaned_files(addon, "Addon"))
        assert orphans == ["Contest.lua", "Latest.lua"]

    def test_backslash_toc_paths_and_flavor_tocs(self, tmp_path):
        addon = self.addon(tmp_path, "UI\\Panel.lua")
        write(addon, "UI/Panel.lua", "x = 1")
        write(addon, "Addon_Vanilla.toc", "## Title: v\nClassic.lua\n")
        write(addon, "Classic.lua", "x = 1")
        orphans = sorted(i.file for i in find_orphaned_files(addon, "Addon"))
        assert orphans == ["Core.lua"]  # only the main TOC omitted it

    def test_xml_loaded_files_are_not_orphans(self, tmp_path):
        addon = self.addon(tmp_path, "Main.xml")
        write(
            addon,
            "Main.xml",
            '<Ui><Script file="Sub\\One.lua"/><Include file="Inc.xml"/></Ui>',
        )
        write(addon, "Inc.xml", '<Ui><Script file="Two.lua"/></Ui>')
        write(addon, "Sub/One.lua", "x = 1")
        write(addon, "Two.lua", "x = 1")
        assert [i.file for i in find_orphaned_files(addon, "Addon")] == ["Core.lua"]

    def test_commented_code_block_and_prose(self, tmp_path):
        code_block = "".join(
            f"-- {line}\n"
            for line in [
                "local function old()",
                "  if x then",
                "    return true",
                "  end",
                "  return false",
                "end",
            ]
        )
        prose = "".join(
            f"-- this function returns the value {i} for the thing\n" for i in range(8)
        )
        block = "--[[\nlocal a = 1\nlocal b = 2\nlocal c = 3\nlocal d = 4\nlocal e = 5\n]]\n"
        lua = write(tmp_path, "Core.lua", code_block + "\n" + prose + "\n" + block)
        issues = find_commented_code_blocks(tmp_path, [lua])
        assert [i.line for i in issues] == [1, 17]

    def test_relative_addon_path_does_not_crash(self, tmp_path, monkeypatch):
        addon = self.addon(tmp_path)
        write(addon, "Orphan.lua", "local function dead() end")
        monkeypatch.chdir(tmp_path)
        result = analyze_deadcode(Path("Addon"), "Addon", DeadCodeInput(addon="Addon"))
        assert {"orphaned_file", "unused_function"} <= set(result.summary.by_category)
        assert all("\\" not in i.file or i.file.count(":") == 0 for i in result.issues)

    def test_xml_handler_reference_keeps_global_function(self, tmp_path):
        addon = self.addon(tmp_path, "Core.lua\nFrame.xml")
        write(
            addon,
            "Core.lua",
            "function Addon_OnLoad() end\nfunction Addon_Dead() end\n",
        )
        write(
            addon,
            "Frame.xml",
            '<Ui><Frame><Scripts><OnLoad function="Addon_OnLoad"/></Scripts></Frame></Ui>',
        )
        result = analyze_deadcode(addon, "Addon", DeadCodeInput(addon="Addon"))
        names = {i.name for i in result.issues if i.category == "unused_function"}
        assert names == {"Addon_Dead"}

    def test_analyze_reports_truncation_and_severity_order(self, tmp_path):
        addon = self.addon(tmp_path)
        write(
            addon,
            "Core.lua",
            "\n".join(f"local function f{i}() end" for i in range(10)),
        )
        write(addon, "Orphan.lua", "x = 1")
        result = analyze_deadcode(addon, "Addon", DeadCodeInput(addon="Addon", limit=2))
        assert result.truncated and result.total_issues == result.summary.total == 11
        assert len(result.issues) == 2
        assert all(i.confidence == "definite" for i in result.issues)
        assert result.summary.by_category["unused_function"] == 10

    def test_category_enum_has_no_unimplemented_detector(self):
        assert "dead_sv_field" not in {c.value for c in DeadCodeCategory}


# ═══════════════════════════════════════════════════════════════════════════════
# Security
# ═══════════════════════════════════════════════════════════════════════════════


class TestSecurityFixes:
    def issues(self, tmp_path, finder, code, *extra):
        lua = write(tmp_path, "Core.lua", code)
        return finder(tmp_path, [lua], *extra)

    def test_frame_methods_are_not_protected_global_calls(self, tmp_path):
        code = (
            "editbox:ClearFocus()\n"
            'frame:SetFrameStrata("DIALOG")\n'
            'frame:SetAttribute("type", "macro")\n'
            "C_Foo.TargetUnit('x')\n"
            "function TargetUnit() end\n"
        )
        assert self.issues(tmp_path, find_combat_violations, code) == []
        assert not {"SetAttribute", "SetFrameStrata", "ClearCursor"} & PROTECTED_APIS

    def test_global_protected_call_is_reported_once_per_call(self, tmp_path):
        code = 'function F()\n  TargetUnit("player") CastSpellByID(1)\nend\n'
        issues = self.issues(tmp_path, find_combat_violations, code)
        assert sorted(i.message.split("'")[1] for i in issues) == [
            "CastSpellByID",
            "TargetUnit",
        ]
        assert {i.confidence for i in issues} == {"likely"}

    def test_guard_must_precede_the_call_in_the_same_function(self, tmp_path):
        code = (
            "function Guarded()\n  if InCombatLockdown() then return end\n  TargetUnit('a')\nend\n"
            "function Unguarded()\n  TargetUnit('b')\nend\n"
            "function After()\n  TargetUnit('c')\n  if InCombatLockdown() then return end\nend\n"
        )
        issues = self.issues(tmp_path, find_combat_violations, code)
        assert [i.line for i in issues] == [6, 9]
        assert {i.confidence for i in issues} == {"suspicious"}

    def test_comments_and_strings_are_ignored(self, tmp_path):
        code = (
            '-- TargetUnit("x")\n'
            '--[[ CastSpellByID(1)\nTargetUnit("y") ]]\n'
            'local s = "TargetUnit(1)"\n'
            "local ok = true -- UseAction(1)\n"
        )
        assert self.issues(tmp_path, find_combat_violations, code) == []
        assert (
            self.issues(
                tmp_path,
                find_unsafe_eval,
                '--[[ loadstring(x) ]]\nlocal s = "loadstring(x)"\n',
            )
            == []
        )

    def test_equality_comparison_is_not_a_global_assignment(self, tmp_path):
        code = 'if _G["SomeGlobal"] == nil then end\nlocal x = _G["Other"] ~= nil\n'
        assert self.issues(tmp_path, find_taint_risks, code, "MyAddon") == []

    def test_global_assignments_are_reported_with_exemptions(self, tmp_path):
        code = (
            '_G["SomeGlobal"] = 1\n'
            "_G.AnotherGlobal = 2\n"
            '_G["MyAddon_Frame"] = 3\n'
            "_G.myaddonLower = 4\n"
            '_G["SLASH_MYADDON1"] = "/m"\n'
            '_G["BINDING_HEADER_MYADDON"] = "H"\n'
            '_G[prefix .. "Frame"] = 5\n'
            '_G["MyAddon" .. n] = 6\n'
            "rawset(_G, 'X', 1)\n"
        )
        issues = self.issues(tmp_path, find_taint_risks, code, "MyAddon")
        by_line = {i.line: i.confidence for i in issues}
        assert by_line == {1: "likely", 2: "likely", 7: "suspicious", 9: "suspicious"}

    def test_secret_leak_direct_and_stored(self, tmp_path):
        code = (
            'print(UnitHealth("target"))\n'
            'local hp = UnitHealthMax("player")\n'
            "SendChatMessage(format('%d', hp))\n"
            'print("UnitHealth is secret")\n'
            "local name = UnitName('x')\nprint(name)\n"
        )
        issues = self.issues(tmp_path, find_secret_leaks, code)
        assert [(i.line, i.confidence) for i in issues] == [
            (1, "definite"),
            (3, "likely"),
        ]

    def test_secret_guard_suppresses_leak(self, tmp_path):
        code = (
            "local hp = UnitHealth('player')\n"
            "if not issecretvalue(hp) then print(hp) end\n"
            "print(issecretvalue(UnitHealth('x')), UnitHealth('x'))\n"
        )
        assert self.issues(tmp_path, find_secret_leaks, code) == []

    def test_unsafe_eval_literal_vs_variable(self, tmp_path):
        code = (
            'loadstring("return 1")\n'
            "loadstring(userInput)\n"
            'loadstring("return " .. code, label)\n'
            "pcall(loadstring, code)\n"
            "obj:loadstring(x)\n"
        )
        issues = self.issues(tmp_path, find_unsafe_eval, code)
        assert [(i.line, i.confidence) for i in issues] == [
            (1, "suspicious"),
            (2, "likely"),
            (3, "likely"),
            (4, "likely"),
        ]

    def test_addon_comm_exec_and_validation(self, tmp_path):
        code = (
            "function Addon:OnCommReceived(prefix, msg)\n"
            "  local f = loadstring(msg)\n"
            "  local data = AceSerializer:Deserialize(msg)\n"
            "end\n"
            "function Addon:Other(msg)\n"
            "  local data = Deserialize(msg)\n"
            "end\n"
            "function Addon:OnCommValid(prefix, msg)\n"
            "  if not ValidateMessage(msg) then return end\n"
            "  local data = Deserialize(msg)\n"
            "end\n"
            'Addon:RegisterComm("PFX", "OnCommValid")\n'
        )
        issues = self.issues(tmp_path, find_addon_comm_issues, code)
        assert [(i.line, i.confidence) for i in issues] == [
            (2, "definite"),
            (3, "suspicious"),
        ]

    def test_loadstring_after_handler_is_not_attributed_to_it(self, tmp_path):
        code = (
            "function Addon:OnCommReceived(prefix, msg)\n"
            "  if msg then print(msg) end\n"
            "end\n"
            "local f = loadstring(other)\n"
        )
        assert self.issues(tmp_path, find_addon_comm_issues, code) == []

    def test_analyze_orders_critical_categories_first(self, tmp_path):
        code = "".join(f"function F{i}()\n  TargetUnit('x')\nend\n" for i in range(5))
        code += "function Addon:OnCommReceived(p, m)\n  loadstring(m)\nend\n"
        write(tmp_path, "Core.lua", code)
        result = analyze_security(
            tmp_path, "Addon", SecurityInput(addon="Addon", limit=2)
        )
        assert result.truncated and result.total_issues >= 7
        assert result.issues[0].category == "addon_comm"
        assert result.issues[0].confidence == "definite"
