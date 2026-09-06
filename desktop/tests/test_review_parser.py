"""Regression coverage for SavedVariables parser integrity and linear scanning."""

import pytest

from mechanic.parsers import parse_lua_table, parse_lua_value, parse_savedvariables


def test_savedvariables_decodes_lua_escapes_and_preserves_unicode():
    source = r"""MechanicDB = { message = "héllo\n\t\"quoted\"\\path\065\010end", ['it\'s'] = true }"""
    assert parse_savedvariables(source) == {
        "MechanicDB": {"message": 'héllo\n\t"quoted"\\pathA\nend', "it's": True}
    }


def test_decimal_escape_consumes_at_most_three_digits():
    assert parse_lua_value(r'"\0654"')[0] == "A4"
    with pytest.raises(ValueError, match="Invalid decimal escape"):
        parse_lua_value(r'"\256"')


def test_escaped_physical_newlines_are_normalized():
    assert parse_lua_value('"line\\\r\nnext"')[0] == "line\nnext"


@pytest.mark.parametrize(
    "source",
    [
        "{",
        "{1, 2",
        "{ key =",
        "{ key = {1}",
        "{ -- tail",
        '{["key" = 1}',
        '{["key"] 1}',
    ],
)
def test_incomplete_tables_and_invalid_keys_raise(source):
    with pytest.raises(ValueError):
        parse_lua_table(source)


def test_truncated_savedvariables_reports_error_instead_of_partial_data():
    parsed = parse_savedvariables("MechanicDB = { complete = 1, incomplete = {2}")
    assert parsed["MechanicDB"].startswith("<parse error:")


def test_existing_table_shapes_and_identifier_references_are_preserved():
    assert parse_lua_value("{}")[0] == {}
    assert parse_lua_value("{1, false, nil}")[0] == [1, False, None]
    assert parse_lua_value("{[1] = 7, [2] = 9}")[0] == {1: 7, 2: 9}
    assert parse_lua_value("{trueValue, nilReference}")[0] == [
        "<trueValue>",
        "<nilReference>",
    ]


def test_large_table_scans_without_copying_remaining_input_per_token():
    class NoSuffixCopies(str):
        def __getitem__(self, key):
            if isinstance(key, slice) and key.stop is None:
                raise AssertionError("token parser copied the remaining document")
            return super().__getitem__(key)

    source = NoSuffixCopies(
        "{" + ",".join(f"entry{i} = {i}" for i in range(5000)) + "}"
    )
    parsed, end = parse_lua_table(source)
    assert len(parsed) == 5000 and parsed["entry4999"] == 4999
    assert end == len(source)
