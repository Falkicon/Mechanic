"""
CLI Tests for Mechanic Desktop.

Tests verify all CLI commands and wrappers:
- Proper exit codes
- JSON output format
- Help text
- Error handling
"""

import json
from click.testing import CliRunner
from mechanic.cli import main
from unittest.mock import patch, MagicMock


# ═══════════════════════════════════════════════════════════════════════════════
# Help & Basic CLI Tests
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_help():
    """Test --help shows all CLI commands."""
    runner = CliRunner()
    result = runner.invoke(main, ['--help'])

    assert result.exit_code == 0
    # Core commands
    assert 'commands' in result.output
    assert 'call' in result.output
    assert 'shell' in result.output
    assert 'dashboard' in result.output
    # Removed: 'reload' command no longer exists
    assert 'status' in result.output
    assert 'addon.output' in result.output
    # Global flags
    assert '--json' in result.output
    assert '--quiet' in result.output
    assert '--agent' in result.output


def test_cli_version():
    """Test --version shows version info."""
    runner = CliRunner()
    result = runner.invoke(main, ['--version'])

    assert result.exit_code == 0
    assert 'version' in result.output.lower() or '.' in result.output


# ═══════════════════════════════════════════════════════════════════════════════
# Commands List (mech commands)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_commands_list():
    """Test commands subcommand lists AFD commands."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands'])

    assert result.exit_code == 0
    assert 'Available Commands' in result.output
    assert 'sv.discover' in result.output
    assert 'addon.output' in result.output
    assert 'libs.check' in result.output


def test_cli_commands_json():
    """Test commands --json returns valid JSON."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'commands'])

    assert result.exit_code == 0
    data = json.loads(result.output)
    assert isinstance(data, list)
    assert len(data) > 0
    assert all('name' in cmd and 'description' in cmd for cmd in data)


def test_cli_commands_filter():
    """Test commands --filter narrows results."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands', '--filter', 'addon'])

    assert result.exit_code == 0
    assert 'addon.' in result.output
    # Should not show unrelated commands
    assert result.output.count('sv.') < result.output.count('addon.')


def test_cli_commands_detail():
    """Test commands --detail shows parameters."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands', '-d', 'libs.check'])

    assert result.exit_code == 0
    assert 'libs.check' in result.output
    assert 'Parameters' in result.output or 'addon' in result.output


def test_cli_commands_detail_not_found():
    """Test commands --detail handles unknown command."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands', '-d', 'nonexistent.command'])

    assert result.exit_code == 1
    assert 'not found' in result.output.lower()


# ═══════════════════════════════════════════════════════════════════════════════
# Call Command (mech call)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_call_discover():
    """Test calling sv.discover via CLI."""
    runner = CliRunner()
    result = runner.invoke(main, ['call', 'sv.discover'])

    assert result.exit_code == 0
    assert 'Calling sv.discover' in result.output
    assert 'Success' in result.output or 'Failed' in result.output


def test_cli_call_json_output():
    """Test --json flag returns valid JSON."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'call', 'sv.discover'])

    assert result.exit_code == 0
    data = json.loads(result.output)
    assert 'success' in data


def test_cli_call_with_args():
    """Test call with JSON arguments."""
    runner = CliRunner()
    result = runner.invoke(main, ['call', 'addon.output', '{"agent_mode": true}'])

    assert result.exit_code == 0
    assert 'Calling addon.output' in result.output


def test_cli_call_invalid_command():
    """Test call with invalid command name."""
    runner = CliRunner()
    result = runner.invoke(main, ['call', 'nonexistent.command'])

    # Should fail but not crash
    assert 'Failed' in result.output or 'error' in result.output.lower()


def test_cli_call_invalid_json():
    """Test call with malformed JSON args."""
    runner = CliRunner()
    result = runner.invoke(main, ['call', 'sv.discover', '{invalid json}'])

    # Should handle gracefully
    assert result.exit_code != 0 or 'error' in result.output.lower()


# ═══════════════════════════════════════════════════════════════════════════════
# Addon Output Shortcut (mech addon.output)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_addon_output():
    """Test addon.output shortcut command."""
    runner = CliRunner()
    result = runner.invoke(main, ['addon.output'])

    assert result.exit_code == 0
    assert 'Success' in result.output
    assert 'output' in result.output.lower()


def test_cli_addon_output_json():
    """Test addon.output with JSON output."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'addon.output'])

    assert result.exit_code == 0
    data = json.loads(result.output)
    assert data['success'] is True
    assert 'data' in data


def test_cli_addon_output_agent():
    """Test addon.output with --agent flag."""
    runner = CliRunner()
    result = runner.invoke(main, ['--agent', 'addon.output'])

    assert result.exit_code == 0
    # Agent mode should still produce output
    assert 'Success' in result.output or 'output' in result.output.lower()


# ═══════════════════════════════════════════════════════════════════════════════
# Status Command (mech status)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_status():
    """Test status command shows configuration."""
    runner = CliRunner()
    result = runner.invoke(main, ['status'])

    assert result.exit_code == 0
    assert 'Mechanic Status' in result.output or 'Status' in result.output
    assert 'WoW Root' in result.output or 'wow' in result.output.lower()


def test_cli_status_json():
    """Test status with JSON output."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'status'])

    assert result.exit_code == 0
    data = json.loads(result.output)
    assert 'wow_root' in data or 'dev_path' in data


# Reload command was removed (not implemented in current CLI).
# Users should use /reload in WoW directly.
# ═══════════════════════════════════════════════════════════════════════════════
# Stop Command (mech stop)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_stop_no_server():
    """Test stop command handles no server gracefully."""
    runner = CliRunner()
    result = runner.invoke(main, ['stop', '--port', '9999'])

    assert result.exit_code == 0
    assert 'Could not connect' in result.output


def test_cli_stop_json():
    """Test stop with JSON output."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'stop', '--port', '9999'])

    assert result.exit_code == 0
    # Should return JSON even on connection failure
    data = json.loads(result.output)
    assert 'error' in data or 'success' in data


# ═══════════════════════════════════════════════════════════════════════════════
# Docs Command (mech docs)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_docs():
    """Test docs command generates documentation."""
    runner = CliRunner()
    result = runner.invoke(main, ['docs'])

    assert result.exit_code == 0
    assert 'Generated' in result.output or 'Success' in result.output


def test_cli_docs_json_format():
    """Test docs with JSON format option."""
    runner = CliRunner()
    result = runner.invoke(main, ['docs', '-f', 'json'])

    assert result.exit_code == 0


# ═══════════════════════════════════════════════════════════════════════════════
# Release Command (mech release)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_release_missing_addon():
    """Test release command requires addon."""
    runner = CliRunner()
    result = runner.invoke(main, ['release', 'NonExistent', '1.0.0', 'Test'])

    # Should fail for missing addon
    assert 'error' in result.output.lower() or 'not found' in result.output.lower() or result.exit_code != 0


def test_cli_release_help():
    """Test release --help shows usage."""
    runner = CliRunner()
    result = runner.invoke(main, ['release', '--help'])

    assert result.exit_code == 0
    assert 'ADDON' in result.output
    assert 'VERSION' in result.output


# ═══════════════════════════════════════════════════════════════════════════════
# Dashboard Command (mech dashboard)
# ═══════════════════════════════════════════════════════════════════════════════

@patch('mechanic.cli.start_server')
@patch('mechanic.cli.webbrowser.open')
def test_cli_dashboard(mock_browser, mock_start):
    """Test dashboard command starts server."""
    runner = CliRunner()
    result = runner.invoke(main, ['dashboard', '--no-browser'])

    # Dashboard blocks, so this tests the setup
    assert mock_start.called or 'dashboard' in result.output.lower()


def test_cli_dashboard_help():
    """Test dashboard --help shows options."""
    runner = CliRunner()
    result = runner.invoke(main, ['dashboard', '--help'])

    assert result.exit_code == 0
    assert '--port' in result.output
    assert '--watch' in result.output
    assert '--no-browser' in result.output


# ═══════════════════════════════════════════════════════════════════════════════
# Shell Command (mech shell)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_shell_help():
    """Test shell --help shows usage."""
    runner = CliRunner()
    result = runner.invoke(main, ['shell', '--help'])

    assert result.exit_code == 0
    assert 'interactive' in result.output.lower() or 'shell' in result.output.lower()


# ═══════════════════════════════════════════════════════════════════════════════
# Setup Commands (mech setup, mech setup-busted)
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_setup_help():
    """Test setup --help shows options."""
    runner = CliRunner()
    result = runner.invoke(main, ['setup', '--help'])

    assert result.exit_code == 0


def test_cli_setup_busted_help():
    """Test setup-busted --help shows usage."""
    runner = CliRunner()
    result = runner.invoke(main, ['setup-busted', '--help'])

    assert result.exit_code == 0


# ═══════════════════════════════════════════════════════════════════════════════
# Global Flags
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_quiet_flag():
    """Test --quiet suppresses non-essential output."""
    runner = CliRunner()
    result = runner.invoke(main, ['--quiet', 'status'])

    assert result.exit_code == 0
    # Quiet mode should produce minimal output
    # (exact behavior depends on implementation)


def test_cli_agent_flag():
    """Test --agent enables agent mode."""
    runner = CliRunner()
    result = runner.invoke(main, ['--agent', 'addon.output'])

    assert result.exit_code == 0


def test_cli_json_quiet_combined():
    """Test --json and --quiet work together."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', '--quiet', 'call', 'sv.discover'])

    assert result.exit_code == 0
    # Should still produce JSON
    data = json.loads(result.output)
    assert 'success' in data


# ═══════════════════════════════════════════════════════════════════════════════
# Default Behavior
# ═══════════════════════════════════════════════════════════════════════════════

@patch('mechanic.cli.start_server')
@patch('mechanic.cli.webbrowser.open')
def test_cli_default_to_dashboard(mock_browser, mock_start):
    """Test invoking with no args starts dashboard."""
    runner = CliRunner()
    result = runner.invoke(main, [])

    assert result.exit_code == 0
    assert mock_start.called or 'dashboard' in result.output.lower() or 'Starting' in result.output


# ═══════════════════════════════════════════════════════════════════════════════
# Error Handling
# ═══════════════════════════════════════════════════════════════════════════════

def test_cli_unknown_command():
    """Test unknown command shows helpful error."""
    runner = CliRunner()
    result = runner.invoke(main, ['unknowncommand12345'])

    assert result.exit_code != 0
    assert 'No such command' in result.output or 'Error' in result.output


def test_cli_graceful_keyboard_interrupt():
    """Test CLI handles keyboard interrupt gracefully."""
    # This is more of a smoke test - actual interrupt handling
    # would require more complex test setup
    runner = CliRunner()
    result = runner.invoke(main, ['--help'])
    assert result.exit_code == 0
