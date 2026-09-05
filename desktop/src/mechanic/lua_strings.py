"""Helpers for safely embedding string data in generated Lua source."""


def quote_lua_string(value: str) -> str:
    """Encode arbitrary text as a Lua quoted string."""
    escapes = {
        "\\": "\\\\",
        '"': '\\"',
        "\n": "\\n",
        "\r": "\\r",
        "\t": "\\t",
        "\b": "\\b",
        "\f": "\\f",
        "\v": "\\v",
    }
    encoded = []
    for char in value:
        if char in escapes:
            encoded.append(escapes[char])
        elif ord(char) < 32 or ord(char) == 127:
            encoded.append(f"\\{ord(char):03d}")
        else:
            encoded.append(char)
    return '"' + "".join(encoded) + '"'
