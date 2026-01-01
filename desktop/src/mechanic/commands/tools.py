"""
AFD commands for tool management.
"""
from typing import List, Optional
from pydantic import BaseModel, Field
from afd.core import CommandResult, CommandContext, success, error


class ToolInfo(BaseModel):
    """Information about a single tool."""
    name: str = Field(..., description="Tool name")
    installed: bool = Field(..., description="Whether tool is installed")
    version: Optional[str] = Field(None, description="Tool version if known")
    path: Optional[str] = Field(None, description="Path to tool")
    required: bool = Field(True, description="Whether tool is required")
    message: Optional[str] = Field(None, description="Status message")


class ToolsStatusInput(BaseModel):
    """Input for tools.status command (empty)."""
    pass


class ToolsStatusOutput(BaseModel):
    """Output for tools.status command."""
    platform: str = Field(..., description="Current platform")
    installed_count: int = Field(..., description="Number of installed tools")
    missing_count: int = Field(..., description="Number of missing tools")
    required_missing: int = Field(..., description="Number of required tools missing")
    tools: List[ToolInfo] = Field(..., description="List of tool statuses")


def register_tools_commands(server):
    """Register tool management commands."""
    
    @server.command(
        name="tools.status",
        description="Check the status of development tools (luacheck, stylua, etc.)",
        input_schema=ToolsStatusInput,
        output_schema=ToolsStatusOutput,
        tags=["tools", "setup"]
    )
    async def tools_status(input: ToolsStatusInput, context: CommandContext) -> CommandResult:
        """Check installation status of all development tools."""
        from ..setup import setup_tools, get_setup_summary
        
        results = setup_tools(verify_only=True)
        summary = get_setup_summary(results)
        
        tools = [
            ToolInfo(
                name=t["name"],
                installed=t.get("installed", False),
                version=t.get("version"),
                path=t.get("path"),
                required=t.get("required", True),
                message=t.get("message")
            )
            for t in summary["tools"]
        ]
        
        output = ToolsStatusOutput(
            platform=summary["platform"],
            installed_count=summary["installed_count"],
            missing_count=summary["missing_count"],
            required_missing=summary["required_missing"],
            tools=tools
        )
        
        if summary["success"]:
            return success(
                data=output,
                reasoning=f"All {summary['installed_count']} required tools installed on {summary['platform']}",
                confidence=1.0
            )
        else:
            return success(
                data=output,
                reasoning=f"{summary['required_missing']} required tool(s) missing. Run 'mech setup' to install.",
                confidence=0.5
            )
