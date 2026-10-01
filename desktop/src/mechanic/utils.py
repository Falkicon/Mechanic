"""
Utility functions for Mechanic Desktop.
"""

import subprocess
import sys

# Focusing the client and sending keys takes well under a second; a hung
# PowerShell/osascript must not block the caller indefinitely.
RELOAD_TIMEOUT_SECONDS = 15


def trigger_wow_reload(keys: str = "^+r", delay: float = 0.1) -> bool:
    """
    Focuses the 'World of Warcraft' window and sends key sequences.

    Windows: Uses PowerShell with WScript.Shell
    macOS: Uses osascript (AppleScript)

    The default key combo is CTRL+SHIFT+R which maps to the Mechanic addon's
    MECHANIC_DEV_RELOAD keybinding (Bindings.xml).

    Args:
        keys: Key sequence to send (default: "^+r" = CTRL+SHIFT+R)
              SendKeys syntax: ^ = Ctrl, + = Shift, % = Alt
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

    # Exact client window titles common in WoW development. AppActivate(title)
    # matches any window whose title merely *starts* with the text (an Explorer
    # window on the install folder, a browser tab...), so resolve the game's
    # own process by exact title and activate it by process id instead.
    window_titles = [
        "World of Warcraft",
        "World of Warcraft (Beta)",
        "World of Warcraft (PTR)",
    ]

    ps_script = f"""
    $wshell = New-Object -ComObject WScript.Shell;
    $titles = @({", ".join(f"'{t}'" for t in window_titles)})
    $game = Get-Process | Where-Object {{
        $_.ProcessName -like 'Wow*' -and $titles -contains $_.MainWindowTitle
    }} | Select-Object -First 1
    $found = $false

    if ($game -and $wshell.AppActivate($game.Id)) {{
        $found = $true
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
            check=False,
            timeout=RELOAD_TIMEOUT_SECONDS,
        )
        return result.returncode == 0
    except (OSError, subprocess.SubprocessError):
        return False


def _trigger_reload_macos(keys: str, delay: float) -> bool:
    """macOS implementation using AppleScript."""
    # Parse SendKeys-style modifiers and convert to AppleScript
    # SendKeys: ^ = Ctrl, + = Shift, % = Alt
    # AppleScript: control down, shift down, option down, command down

    modifiers = []
    key_char = keys

    # Extract modifiers from the beginning of the string
    while key_char and key_char[0] in "^+%":
        if key_char[0] == "^":
            modifiers.append("control down")
        elif key_char[0] == "+":
            modifiers.append("shift down")
        elif key_char[0] == "%":
            modifiers.append("option down")
        key_char = key_char[1:]

    # Build the keystroke command
    modifier_str = ", ".join(modifiers)
    if modifier_str:
        key_cmd = f'keystroke "{key_char}" using {{{modifier_str}}}'
    else:
        key_cmd = f'keystroke "{key_char}"'

    script = f"""
    tell application "World of Warcraft" to activate
    delay {delay}
    tell application "System Events"
        {key_cmd}
    end tell
    """

    try:
        result = subprocess.run(
            ["osascript", "-e", script],
            capture_output=True,
            text=True,
            check=False,
            timeout=RELOAD_TIMEOUT_SECONDS,
        )
        return result.returncode == 0
    except (OSError, subprocess.SubprocessError):
        return False
