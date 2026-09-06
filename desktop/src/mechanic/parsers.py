import re

_NUMBER = re.compile(r"-?(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?")
_IDENTIFIER = re.compile(r"[a-zA-Z_][a-zA-Z0-9_]*")
_NAMED_FIELD = re.compile(r"([a-zA-Z_][a-zA-Z0-9_]*)\s*=")
_ESCAPES = {"a": "\a", "b": "\b", "f": "\f", "n": "\n", "r": "\r", "t": "\t", "v": "\v"}


def parse_lua_value(text, pos=0):
    """Parse a Lua value starting at pos. Returns (value, new_pos)."""
    # Skip whitespace and comments
    while pos < len(text):
        if text[pos : pos + 2] == "--":
            end = text.find("\n", pos)
            pos = end + 1 if end != -1 else len(text)
        elif text[pos] in " \t\n\r":
            pos += 1
        else:
            break

    if pos >= len(text):
        raise ValueError(f"Expected value at position {pos}")

    char = text[pos]

    # String (double/single quote)
    if char == '"' or char == "'":
        quote = char
        end = pos + 1
        parts = []
        while end < len(text):
            if text[end] == "\\":
                end += 1
                if end >= len(text):
                    break
                escaped = text[end]
                if escaped in "0123456789":
                    start = end
                    while end < min(start + 3, len(text)) and text[end] in "0123456789":
                        end += 1
                    code = int(text[start:end])
                    if code > 255:
                        raise ValueError(f"Invalid decimal escape at position {start}")
                    parts.append(chr(code))
                    continue
                if escaped in "\r\n":
                    if (
                        end + 1 < len(text)
                        and text[end + 1] in "\r\n"
                        and text[end + 1] != escaped
                    ):
                        end += 1
                    parts.append("\n")
                else:
                    # Lua 5.1 also accepts escaped punctuation and unknown letters.
                    parts.append(_ESCAPES.get(escaped, escaped))
                end += 1
            elif text[end] == quote:
                return "".join(parts), end + 1
            else:
                parts.append(text[end])
                end += 1
        raise ValueError(f"Unterminated string at position {pos}")

    # Table
    if char == "{":
        return parse_lua_table(text, pos)

    # Number
    num_match = _NUMBER.match(text, pos)
    if num_match:
        num_str = num_match.group()
        end = pos + len(num_str)
        try:
            if "." in num_str or "e" in num_str.lower():
                return float(num_str), end
            else:
                return int(num_str), end
        except ValueError:
            pass

    # Identifier (for table references)
    id_match = _IDENTIFIER.match(text, pos)
    if id_match:
        identifier = id_match.group()
        if identifier in ("true", "false", "nil"):
            return {"true": True, "false": False, "nil": None}[
                identifier
            ], id_match.end()
        return f"<{identifier}>", id_match.end()

    raise ValueError(f"Unexpected character '{char}' at position {pos}")


def parse_lua_table(text, pos=0):
    """Parse a Lua table starting at pos. Returns (dict/list, new_pos)."""
    if pos >= len(text) or text[pos] != "{":
        raise ValueError(f"Expected '{{' at position {pos}")

    pos += 1
    result = {}
    array_index = 1
    is_array = True
    closed = False

    while pos < len(text):
        while pos < len(text) and text[pos] in " \t\n\r":
            pos += 1

        if pos >= len(text):
            break

        if text[pos : pos + 2] == "--":
            end = text.find("\n", pos)
            pos = end + 1 if end != -1 else len(text)
            continue

        if text[pos] == "}":
            pos += 1
            closed = True
            break

        if text[pos] in ",;":
            pos += 1
            continue

        # [key] = value
        if text[pos] == "[":
            pos += 1
            while pos < len(text) and text[pos] in " \t\n\r":
                pos += 1
            key, pos = parse_lua_value(text, pos)
            while pos < len(text) and text[pos] in " \t\n\r":
                pos += 1
            if pos >= len(text) or text[pos] != "]":
                raise ValueError(f"Expected ']' at position {pos}")
            pos += 1
            while pos < len(text) and text[pos] in " \t\n\r":
                pos += 1
            if pos >= len(text) or text[pos] != "=":
                raise ValueError(f"Expected '=' at position {pos}")
            pos += 1
            value, pos = parse_lua_value(text, pos)
            result[key] = value
            is_array = False
            continue

        # key = value
        id_match = _NAMED_FIELD.match(text, pos)
        if id_match:
            key = id_match.group(1)
            pos = id_match.end()
            value, pos = parse_lua_value(text, pos)
            result[key] = value
            is_array = False
            continue

        # Array value
        value, pos = parse_lua_value(text, pos)
        result[array_index] = value
        array_index += 1

    if not closed:
        raise ValueError(f"Unterminated table at position {pos}")

    if is_array and result:
        max_key = max(k for k in result.keys() if isinstance(k, int))
        if all(isinstance(k, int) and 1 <= k <= max_key for k in result.keys()):
            return [result.get(i) for i in range(1, max_key + 1)], pos

    return result, pos


def _parse_savedvariables(content):
    """Parse a SavedVariables file content. Returns variable_name -> value."""
    variables = {}
    pattern = re.compile(r"^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*", re.MULTILINE)

    for match in pattern.finditer(content):
        var_name = match.group(1)
        start_pos = match.end()
        try:
            value, _ = parse_lua_value(content, start_pos)
            variables[var_name] = value
        except Exception as e:
            variables[var_name] = f"<parse error: {e}>"
    return variables


def parse_savedvariables(content):
    """Measure parsing without retaining any SavedVariables data."""
    from .telemetry import metrics

    token = metrics.begin("parser:savedvariables")
    failed = True
    try:
        result = _parse_savedvariables(content)
        failed = any(
            isinstance(value, str) and value.startswith("<parse error:")
            for value in result.values()
        )
        return result
    finally:
        metrics.finish(token, failed=failed)
