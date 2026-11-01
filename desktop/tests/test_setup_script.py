"""Exercise the batch architecture probe without installing any tools."""

import os
from pathlib import Path
import struct
import subprocess

import pytest


@pytest.mark.skipif(os.name != "nt", reason="Windows batch setup script")
@pytest.mark.parametrize(
    "machine,expected", [(0x14C, "x86"), (0x8664, "x64"), (0, "unknown")]
)
def test_architecture_probe_handles_quoted_paths(tmp_path, machine, expected):
    script = Path(__file__).resolve().parents[1] / "scripts" / "setup_dev_env.bat"
    # Run the actual probe line through cmd, leaving all installation steps out.
    probe = next(
        line for line in script.read_text().splitlines() if line.startswith("for /f ")
    )
    executable = tmp_path / "O'Brien (test)" / "lua.exe"
    executable.parent.mkdir()
    data = bytearray(128)
    struct.pack_into("<I", data, 0x3C, 64)
    struct.pack_into("<H", data, 68, machine)
    executable.write_bytes(data)
    harness = tmp_path / "probe.bat"
    harness.write_text(
        '@echo off\nset "LUA_ARCH="\n' + probe + "\necho ARCH=%LUA_ARCH%\n"
    )
    env = os.environ.copy()
    env["LUA_EXE"] = str(executable)
    result = subprocess.run(
        ["cmd.exe", "/d", "/c", str(harness)],
        env=env,
        capture_output=True,
        text=True,
        timeout=30,
    )
    assert result.returncode == 0, result.stderr
    assert f"ARCH={expected}" in result.stdout, (result.stdout, result.stderr)


@pytest.mark.skipif(os.name != "nt", reason="Windows batch setup script")
@pytest.mark.parametrize("missing", [True, False])
def test_setup_preflight_errors_with_parentheses_in_path(tmp_path, missing):
    source = Path(__file__).resolve().parents[1] / "scripts" / "setup_dev_env.bat"
    desktop = tmp_path / "O'Brien (test)" / "desktop"
    (desktop / "scripts").mkdir(parents=True)
    script = desktop / "scripts" / "setup_dev_env.bat"
    script.write_bytes(source.read_bytes())
    if not missing:
        (desktop / "bin").mkdir()
        data = bytearray(128)
        struct.pack_into("<I", data, 0x3C, 64)
        (desktop / "bin" / "lua.exe").write_bytes(data)
    result = subprocess.run(
        ["cmd.exe", "/d", "/c", str(script)],
        capture_output=True,
        text=True,
        timeout=30,
    )
    assert result.returncode == 1
    assert "[ERROR]" in result.stdout
    assert "unexpected" not in result.stderr.lower()
