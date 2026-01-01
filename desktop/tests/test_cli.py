"""
CLI tests for Mechanic Desktop.

Tests verify AFD-compliant CLI behavior.
"""

from click.testing import CliRunner
from mechanic.cli import main
import json
from unittest.mock import patch


def test_cli_help():
    """Test that --help shows all AFD commands."""
    runner = CliRunner()
    result = runner.invoke(main, ['--help'])
    assert result.exit_code == 0
    # AFD-style commands
    assert 'commands' in result.output  # List commands
    assert 'call' in result.output       # Call command
    assert 'shell' in result.output      # Interactive shell
    assert 'dashboard' in result.output
    assert '--json' in result.output     # JSON output flag
    assert '--quiet' in result.output    # Quiet flag


def test_cli_call_discover():
    """Test calling sv.discover via CLI."""
    runner = CliRunner()
    result = runner.invoke(main, ['call', 'sv.discover'])
    assert result.exit_code == 0
    # AFD-style output
    assert 'Calling sv.discover' in result.output
    assert 'Success' in result.output


def test_cli_call_json_output():
    """Test --json flag returns valid JSON."""
    runner = CliRunner()
    result = runner.invoke(main, ['--json', 'call', 'sv.discover'])
    assert result.exit_code == 0
    # Should be parseable JSON
    data = json.loads(result.output)
    assert 'success' in data
    assert data['success'] is True


def test_cli_commands_list():
    """Test commands subcommand lists AFD commands."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands'])
    assert result.exit_code == 0
    assert 'Available Commands' in result.output
    assert 'sv.discover' in result.output
    assert 'libs.check' in result.output


def test_cli_commands_detail():
    """Test commands --detail shows parameters."""
    runner = CliRunner()
    result = runner.invoke(main, ['commands', '-d', 'libs.check'])
    assert result.exit_code == 0
    assert 'libs.check' in result.output
    assert 'Parameters' in result.output
    assert 'addon' in result.output


@patch('mechanic.cli.asyncio.run')
def test_cli_reload_command(mock_run):
    """Test reload command triggers execution."""
    runner = CliRunner()
    result = runner.invoke(main, ['reload', '--key', '9'])
    assert result.exit_code == 0
    assert 'Triggering reload' in result.output or 'Success' in result.output


def test_cli_stop_no_server():
    """Test stop command handles no server gracefully."""
    runner = CliRunner()
    result = runner.invoke(main, ['stop', '--port', '9999'])
    assert result.exit_code == 0
    assert 'Could not connect' in result.output


def test_cli_status():
    """Test status command shows configuration."""
    runner = CliRunner()
    result = runner.invoke(main, ['status'])
    assert result.exit_code == 0
    assert 'Mechanic Status' in result.output
    assert 'WoW Root' in result.output


@patch('mechanic.cli.start_server')
@patch('mechanic.cli.webbrowser.open')
def test_cli_default_to_dashboard(mock_browser, mock_start):
    """Test that invoking with no args starts dashboard."""
    runner = CliRunner()
    result = runner.invoke(main, [])
    assert result.exit_code == 0
    assert 'dashboard' in result.output.lower() or 'Starting' in result.output
    mock_start.assert_called_once()
