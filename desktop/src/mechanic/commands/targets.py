"""Discover the diagnostic identities available to producers and consumers."""

from typing import Any, List
from pydantic import BaseModel
from afd import CommandResult, success
from ..targets import SelectedTarget, discover_targets, TargetError


class TargetsInput(BaseModel):
    pass


class TargetsResult(BaseModel):
    targets: List[SelectedTarget]


def register_commands(server):
    @server.command(
        name="diagnostic.targets",
        description="List deterministic client/account/character/profile diagnostic targets",
        input_schema=TargetsInput,
        output_schema=TargetsResult,
    )
    async def diagnostic_targets(
        input: TargetsInput, context: Any = None
    ) -> CommandResult[TargetsResult]:
        try:
            return success(data=TargetsResult(targets=discover_targets()))
        except TargetError as exc:
            return exc.result()
