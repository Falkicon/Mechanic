"""Schema catalog and explicit mutation audit. New commands must be audited.

Mutation includes persistent writes, process/UI actions and arbitrary code execution.
Preview-capable commands remain potentially mutating.
"""

from typing import Any
from pydantic import BaseModel, Field
from afd import CommandResult, success
from afd.server.decorators import get_command_metadata

READ_ONLY = frozenset(
    """
sv.parse sv.discover dashboard.metrics addon.validate addon.lint addon.deprecations
addon.deadcode addon.complexity addon.security docs.stale locale.validate locale.extract
atlas.search libs.check env.status tools.status addon.output api.search api.info api.list
api.stats lua.results sandbox.status assets.list fencore-catalog fencore-search fencore-info
commands.list diagnostic.targets diagnostic.metrics
""".split()
)
MUTATING = frozenset(
    """
server.shutdown addon.format addon.test version.bump changelog.add git.commit git.tag
release.all addon.create addon.sync libs.init libs.sync system.pick_file atlas.scan
docs.generate api.queue lua.queue sandbox.generate sandbox.exec sandbox.test research.query
assets.sync perf.baseline perf.compare perf.report perf.list api.populate api.generate
api.refresh api.download
""".split()
)
# perf reads currently create the baseline directory; code execution may write arbitrary
# files. Both are intentionally advertised as potentially mutating.


def apply_mutation_audit(server):
    for command in server.list_commands():
        if command.name not in READ_ONLY | MUTATING:
            raise ValueError(f"Missing mutation audit for {command.name}")
        command.mutation = command.name in MUTATING
        metadata = get_command_metadata(command.handler)
        if metadata:
            metadata.mutation = command.mutation


class CatalogInput(BaseModel):
    pass


class CatalogEntry(BaseModel):
    name: str
    description: str
    input_schema: dict[str, Any]
    output_schema: dict[str, Any]
    mutation: bool


class CatalogOutput(BaseModel):
    commands: list[CatalogEntry] = Field(default_factory=list)


def register_commands(server):
    @server.command(
        name="commands.list",
        description="List command schemas and mutation metadata",
        input_schema=CatalogInput,
        output_schema=CatalogOutput,
    )
    async def list_commands(
        input: CatalogInput, context: Any = None
    ) -> CommandResult[CatalogOutput]:
        entries = []
        for command in sorted(server.list_commands(), key=lambda item: item.name):
            metadata = get_command_metadata(command.handler)

            def schema(model):
                return (
                    model.model_json_schema()
                    if model
                    else {"type": "object", "additionalProperties": True}
                )

            entries.append(
                CatalogEntry(
                    name=command.name,
                    description=command.description,
                    input_schema=schema(metadata.input_schema if metadata else None),
                    output_schema=schema(metadata.output_schema if metadata else None),
                    mutation=command.mutation,
                )
            )
        return success(
            CatalogOutput(commands=entries),
            reasoning="Catalog from registered command schemas",
        )
