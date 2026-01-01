"""
Utility functions for Mechanic Desktop.
"""

import subprocess
import sys


def trigger_wow_reload(keys: str = "9", delay: float = 0.1) -> bool:
    """
    Focuses the 'World of Warcraft' window and sends key sequences.
    
    Windows: Uses PowerShell with WScript.Shell
    macOS: Uses osascript (AppleScript)
    
    Args:
        keys: Key sequence to send (default: "9" for Numpad 9)
        delay: Delay in seconds before sending keys
        
    Returns:
        True if successful, False otherwise
    """
    if sys.platform == "win32":
        return _trigger_reload_windows(keys, delay)
    elif sys.platform == "darwin":
        return _trigger_reload_macos(keys, delay)
    else:
        # Linux not supported for window focus
        return False


def _trigger_reload_windows(keys: str, delay: float) -> bool:
    """Windows implementation using PowerShell."""
    # Escape single quotes for PowerShell
    keys = keys.replace("'", "''")
    
    # Try multiple window titles common in WoW development
    window_titles = ["World of Warcraft", "World of Warcraft (Beta)", "World of Warcraft (PTR)"]
    
    ps_script = f"""
    $wshell = New-Object -ComObject WScript.Shell;
    $titles = @({', '.join(f"'{t}'" for t in window_titles)})
    $found = $false
    
    foreach ($title in $titles) {{
        if ($wshell.AppActivate($title)) {{
            $found = $true
            break
        }}
    }}

    if ($found) {{
        Start-Sleep -m {int(delay * 1000)};
        $wshell.SendKeys('{keys}');
        exit 0;
    }} else {{
        exit 1;
    }}
    """
    
    try:
        result = subprocess.run(
            ["powershell", "-NoProfile", "-Command", ps_script], 
            capture_output=True, 
            text=True,
            check=False
        )
        return result.returncode == 0
    except Exception:
        return False


def _trigger_reload_macos(keys: str, delay: float) -> bool:
    """macOS implementation using AppleScript."""
    # Map common keys to AppleScript key codes
    key_map = {
        "9": "key code 92",  # Numpad 9
        "{ENTER}": "key code 36",
        "{ESC}": "key code 53",
    }
    
    key_cmd = key_map.get(keys, f'keystroke "{keys}"')
    
    script = f'''
    tell application "World of Warcraft" to activate
    delay {delay}
    tell application "System Events"
        {key_cmd}
    end tell
    '''
    
    try:
        result = subprocess.run(
            ["osascript", "-e", script],
            capture_output=True,
            text=True,
            check=False
        )
        return result.returncode == 0
    except Exception:
        return False
