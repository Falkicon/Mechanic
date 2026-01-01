import re
import json

def parse_lua_value(text, pos=0):
    """Parse a Lua value starting at pos. Returns (value, new_pos)."""
    # Skip whitespace and comments
    while pos < len(text):
        if text[pos:pos+2] == '--':
            end = text.find('\n', pos)
            pos = end + 1 if end != -1 else len(text)
        elif text[pos] in ' \t\n\r':
            pos += 1
        else:
            break
    
    if pos >= len(text):
        return None, pos
    
    char = text[pos]
    
    # String (double/single quote)
    if char == '"' or char == "'":
        quote = char
        end = pos + 1
        while end < len(text):
            if text[end] == '\\':
                end += 2
            elif text[end] == quote:
                return text[pos+1:end], end + 1
            else:
                end += 1
        raise ValueError(f"Unterminated string at position {pos}")
    
    # Table
    if char == '{':
        return parse_lua_table(text, pos)
    
    # Boolean/nil
    if text[pos:pos+4] == 'true':
        return True, pos + 4
    if text[pos:pos+5] == 'false':
        return False, pos + 5
    if text[pos:pos+3] == 'nil':
        return None, pos + 3
    
    # Number
    num_match = re.match(r'-?(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?', text[pos:])
    if num_match:
        num_str = num_match.group()
        end = pos + len(num_str)
        try:
            if '.' in num_str or 'e' in num_str.lower():
                return float(num_str), end
            else:
                return int(num_str), end
        except ValueError:
            pass
    
    # Identifier (for table references)
    id_match = re.match(r'[a-zA-Z_][a-zA-Z0-9_]*', text[pos:])
    if id_match:
        return f"<{id_match.group()}>", pos + len(id_match.group())
    
    raise ValueError(f"Unexpected character '{char}' at position {pos}")

def parse_lua_table(text, pos=0):
    """Parse a Lua table starting at pos. Returns (dict/list, new_pos)."""
    if text[pos] != '{':
        raise ValueError(f"Expected '{{' at position {pos}")
    
    pos += 1
    result = {}
    array_index = 1
    is_array = True
    
    while pos < len(text):
        while pos < len(text) and text[pos] in ' \t\n\r':
            pos += 1
        
        if pos >= len(text):
            break
        
        if text[pos:pos+2] == '--':
            end = text.find('\n', pos)
            pos = end + 1 if end != -1 else len(text)
            continue
        
        if text[pos] == '}':
            pos += 1
            break
        
        if text[pos] in ',;':
            pos += 1
            continue
        
        # [key] = value
        if text[pos] == '[':
            pos += 1
            while pos < len(text) and text[pos] in ' \t\n\r':
                pos += 1
            key, pos = parse_lua_value(text, pos)
            while pos < len(text) and text[pos] in ' \t\n\r':
                pos += 1
            if pos < len(text) and text[pos] == ']':
                pos += 1
            while pos < len(text) and text[pos] in ' \t\n\r':
                pos += 1
            if pos < len(text) and text[pos] == '=':
                pos += 1
            value, pos = parse_lua_value(text, pos)
            result[key] = value
            is_array = False
            continue
        
        # key = value
        id_match = re.match(r'([a-zA-Z_][a-zA-Z0-9_]*)\s*=', text[pos:])
        if id_match:
            key = id_match.group(1)
            pos += len(id_match.group())
            value, pos = parse_lua_value(text, pos)
            result[key] = value
            is_array = False
            continue
        
        # Array value
        value, pos = parse_lua_value(text, pos)
        result[array_index] = value
        array_index += 1
    
    if is_array and result:
        max_key = max(k for k in result.keys() if isinstance(k, int))
        if all(isinstance(k, int) and 1 <= k <= max_key for k in result.keys()):
            return [result.get(i) for i in range(1, max_key + 1)], pos
    
    return result, pos

def parse_savedvariables(content):
    """Parse a SavedVariables file content. Returns variable_name -> value."""
    variables = {}
    pattern = re.compile(r'^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*', re.MULTILINE)
    
    for match in pattern.finditer(content):
        var_name = match.group(1)
        start_pos = match.end()
        try:
            value, _ = parse_lua_value(content, start_pos)
            variables[var_name] = value
        except Exception as e:
            variables[var_name] = f"<parse error: {e}>"
    return variables
