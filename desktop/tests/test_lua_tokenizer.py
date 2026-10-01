"""
Tests for the Lua tokenizer and the structure walker the analyzers are built on.
"""

from mechanic.lua_structure import parse_lua
from mechanic.lua_tokenizer import STRING, tokenize, strip_comments


def kinds_values(source):
    tokens, _ = tokenize(source)
    return [(t.kind, t.value) for t in tokens]


class TestTokenizer:
    def test_dashes_inside_strings_are_not_comments(self):
        tokens, comments = tokenize('local s = "a -- b" -- real comment')
        assert ("string", "a -- b") in [(t.kind, t.value) for t in tokens]
        assert [c.text.strip() for c in comments] == ["real comment"]
        assert comments[0].trailing is True

    def test_function_and_end_inside_strings_are_ignored(self):
        tokens, _ = tokenize('local s = "function foo() end"')
        assert [t.kind for t in tokens] == ["keyword", "name", "op", "string"]

    def test_long_strings_and_block_comments(self):
        src = "local a = [==[x]]y]==] --[[ multi\nline ]] local b = 1"
        tokens, comments = tokenize(src)
        strings = [t for t in tokens if t.kind == STRING]
        assert strings[0].value == "x]]y"
        assert comments[0].is_block and comments[0].end_line == 2
        # tokens after a multi-line comment keep correct line numbers
        assert [t.line for t in tokens if t.value == "b"] == [2]

    def test_numbers_and_operators(self):
        values = kinds_values("x = 0x1F + .5e3 .. y ~= z <= 3 ...")
        assert ("number", "0x1F") in values
        assert ("number", ".5e3") in values
        assert ("op", "..") in values
        assert ("op", "~=") in values
        assert ("op", "<=") in values
        assert ("op", "...") in values

    def test_equality_is_one_operator(self):
        values = kinds_values('_G["x"] == nil')
        assert ("op", "==") in values
        assert ("op", "=") not in values

    def test_escaped_quote_and_unterminated_string(self):
        tokens, _ = tokenize('a = "q\\"uote"\nb = "open\nc = 1')
        names = [t.value for t in tokens if t.kind == "name"]
        assert names == ["a", "b", "c"]

    def test_line_and_column_tracking(self):
        tokens, _ = tokenize("local x\n  local y")
        second = [t for t in tokens if t.value == "y"][0]
        assert (second.line, second.col) == (2, 9)

    def test_strip_comments_keeps_lines_and_strings(self):
        src = 'x = "keep -- this" -- drop\n--[[ block\nmore ]] y = 2\n'
        out = strip_comments(src)
        assert "keep -- this" in out
        assert "drop" not in out and "block" not in out
        assert out.count("\n") == src.count("\n")

    def test_bom_is_ignored(self):
        tokens, _ = tokenize(chr(0xFEFF) + "local x = 1")
        assert tokens[0].value == "local" and tokens[0].col == 1


class TestStructure:
    def test_single_line_blocks_do_not_accumulate_depth(self):
        src = "local function f(x)\n" + "    if not x then return end\n" * 5 + "end\n"
        parsed = parse_lua(src)
        assert max(parsed.max_depth_by_line().values()) == 1
        assert max(b.depth for b in parsed.blocks) == 1

    def test_nested_depth_counts_true_blocks(self):
        src = (
            "function F()\n"
            "  for i = 1, 3 do\n"
            "    while a do\n"
            "      if b then\n"
            "        repeat\n"
            "          x = 1\n"
            "        until c\n"
            "      end\n"
            "    end\n"
            "  end\n"
            "end\n"
        )
        parsed = parse_lua(src)
        assert max(parsed.max_depth_by_line().values()) == 4  # top-level function is 0

    def test_for_do_does_not_open_extra_block(self):
        parsed = parse_lua("for i = 1, 2 do\n  x = i\nend\ny = 1\n")
        assert [b.kind for b in parsed.blocks] == ["chunk", "for"]
        end_tok = parsed.blocks[1].end
        assert parsed.tokens[end_tok].value == "end"

    def test_function_forms(self):
        src = (
            "local function helper() end\n"
            "function Global() end\n"
            "function A.b.c() end\n"
            "function Addon:Method() end\n"
            "local anon = function() end\n"
            "Addon.Field = function() end\n"
            "local t = { key = function() end }\n"
            "frame:SetScript('OnEvent', function() end)\n"
        )
        funcs = {f.name: f for f in parse_lua(src).functions}
        assert funcs["helper"].kind == "local" and funcs["helper"].is_local
        assert funcs["Global"].kind == "global"
        assert funcs["A.b.c"].namespace == "A.b"
        assert (
            funcs["Addon:Method"].is_method
            and funcs["Addon:Method"].namespace == "Addon"
        )
        assert funcs["anon"].kind == "local"
        assert funcs["Addon.Field"].kind == "namespaced"
        assert funcs["key"].kind == "field" and not funcs["key"].named
        assert funcs["anonymous"].kind == "anonymous"

    def test_function_end_line_matches_its_own_end(self):
        src = (
            "local function f()\n  if a then\n    b()\n  end\n  c()\nend\nlocal x = 1\n"
        )
        func = parse_lua(src).functions[0]
        assert (func.line, func.end_line) == (1, 6)
        assert func.length == 5

    def test_unreachable_only_in_same_block(self):
        src = (
            "local function f(x)\n"
            "  if x then\n"
            "    return 1\n"
            "  else\n"
            "    return 2\n"
            "  end\n"
            "end\n"
            "local function g(x)\n"
            "  if not x then return end\n"
            "  print(x)\n"
            "  do return end\n"
            "end\n"
            "local function h()\n"
            "  return 1\n"
            "  print('dead')\n"
            "end\n"
        )
        assert [u.line for u in parse_lua(src).unreachable] == [15]

    def test_return_value_expressions_are_not_statements(self):
        src = (
            "local function f(a, b)\n"
            "  return a and b or\n"
            "    function() return 1 end, {\n"
            "      x = 1,\n"
            "    }, not a, -b, #t, obj:method(1), s:format 'x'\n"
            "end\n"
        )
        assert parse_lua(src).unreachable == []

    def test_break_then_statement_is_unreachable(self):
        parsed = parse_lua("while true do\n  break\n  print(1)\nend\n")
        assert [(u.line, u.terminator) for u in parsed.unreachable] == [(3, "break")]

    def test_reads_exclude_definitions_params_and_targets(self):
        src = (
            "local count = 5\n"
            "local function f(param)\n"
            "  return param\n"
            "end\n"
            "local t = { count = 1 }\n"
            "count = count + 1\n"
            "print(count, f)\n"
        )
        parsed = parse_lua(src)
        assert len(parsed.reads["count"]) == 2  # `count + 1` and print(count)
        assert len(parsed.reads["f"]) == 1
        assert len(parsed.reads["param"]) == 1

    def test_member_refs_and_method_calls(self):
        parsed = parse_lua(
            "function Addon:Foo() end\nself:Foo()\nAddon.Bar = 1\nx = Addon.Baz\n"
        )
        assert parsed.member_refs["Foo"] == 1
        assert "Bar" not in parsed.member_refs  # assignment target, not a reference
        assert parsed.member_refs["Baz"] == 1
        assert "Foo" in parsed.calls

    def test_dispatch_strings_and_callbacks(self):
        src = (
            'self:RegisterEvent("PLAYER_LOGIN", "HandleLogin")\n'
            'self:RegisterMessage("MSG", "OnMsg")\n'
            'hooksecurefunc("Global", myHook)\n'
            'frame:SetScript("OnEvent", handler)\n'
            'local x = _G["NamedGlobal"]\n'
        )
        parsed = parse_lua(src)
        assert {
            "HandleLogin",
            "OnMsg",
            "Global",
            "NamedGlobal",
        } <= parsed.dispatch_strings
        assert {"myHook", "handler"} <= parsed.callback_refs
        assert parsed.events == [("PLAYER_LOGIN", "HandleLogin", 1)]
        assert parsed.dynamic is False

    def test_dynamic_patterns(self):
        assert parse_lua("x = _G[name]").dynamic
        assert parse_lua("local f = loadstring(s)").dynamic
        assert parse_lua("handlers[event](a)").dynamic
        assert not parse_lua('x = _G["name"]\nt["k"](1)').dynamic

    def test_locale_and_libraries(self):
        src = (
            'L["A"] = "a"\n'
            'print(L["B"], L[var], L["P_" .. x], L.C)\n'
            'local lib = LibStub("AceAddon-3.0"):NewAddon("X", "AceEvent-3.0")\n'
            'local db = LibStub:GetLibrary("AceDB-3.0")\n'
        )
        parsed = parse_lua(src)
        assert parsed.locale_defs == {"A": 1}
        assert parsed.locale_uses == {"B", "C"}
        assert parsed.locale_prefixes == {"P_"} and parsed.locale_dynamic
        assert {"AceAddon-3.0", "AceEvent-3.0", "AceDB-3.0"} <= parsed.libs

    def test_local_scope_ends_with_block(self):
        src = "do\n  local inner = 1\nend\nprint(inner)\n"
        parsed = parse_lua(src)
        decl = parsed.locals[0]
        assert parsed.reads_between("inner", decl.tok + 1, decl.scope_end) == 0

    def test_unclosed_blocks_are_tolerated(self):
        parsed = parse_lua("function f()\n  if x then\n")
        assert parsed.functions[0].end_line >= 1
