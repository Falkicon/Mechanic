"""
Research commands for WoW addon development.
Provides web search capabilities via Gemini API.

Migrated from ADDON_DEV/Tools/GeminiResearch to AFD commands.
"""

import asyncio
import os
import re
from typing import Any, List, Literal

from afd import CommandResult, success, error
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..config import get_gemini_api_key


# ═══════════════════════════════════════════════════════════════════════════════
# SCHEMAS
# ═══════════════════════════════════════════════════════════════════════════════


class ResearchQueryInput(BaseModel):
    query: str = Field(..., description="Search query or question")
    mode: Literal["fast", "thinking"] = Field(
        default="fast",
        description="Search mode: 'fast' (Gemini Flash, ~15-30s) or 'thinking' (Gemini Pro, ~30-90s)",
    )
    json_output: bool = Field(
        default=False, description="Request structured JSON response"
    )


class ResearchQueryOutput(BaseModel):
    answer: str = Field(..., description="The research answer")
    mode: str = Field(..., description="Mode used for the search")
    sources: List[str] = Field(
        default_factory=list, description="Source URLs if available"
    )


# ═══════════════════════════════════════════════════════════════════════════════
# MODEL CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════════

# Model IDs are Gemini preview names and change without notice: override them
# with MECHANIC_GEMINI_FAST_MODEL / MECHANIC_GEMINI_THINKING_MODEL instead of
# editing this file when Google retires a preview.
DEFAULT_MODELS = {
    "fast": "gemini-3-flash-preview",
    "thinking": "gemini-3-pro-preview",
}
SEARCH_MODELS = {
    mode: os.environ.get(f"MECHANIC_GEMINI_{mode.upper()}_MODEL", default)
    for mode, default in DEFAULT_MODELS.items()
}

# Grounded search takes 15-90 s; give up instead of hanging the command.
REQUEST_TIMEOUT_SECONDS = 120


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def _check_genai_available():
    """Check if google-genai is installed."""
    try:
        from google import genai

        _ = genai
        return True
    except ImportError:
        return False


def _extract_json_from_response(text: str) -> str:
    """Extract JSON block from markdown-formatted response."""
    if "```json" in text:
        match = re.search(r"```json\s*(.*?)\s*```", text, re.DOTALL)
        if match:
            return match.group(1)
    return text


def _generate_grounded(
    api_key: str, model_name: str, prompt: str, mode: str
) -> "tuple[str, List[str]]":
    """Blocking Gemini call with Google Search grounding (run in a worker thread)."""
    from google import genai
    from google.genai.types import Tool, GoogleSearch, GenerateContentConfig

    client = genai.Client(api_key=api_key)
    config = GenerateContentConfig(
        tools=[Tool(google_search=GoogleSearch())],
        temperature=0.7 if mode == "fast" else 0.5,
    )
    response = client.models.generate_content(
        model=model_name, contents=prompt, config=config
    )

    sources: List[str] = []
    if getattr(response, "candidates", None):
        metadata = getattr(response.candidates[0], "grounding_metadata", None)
        for chunk in getattr(metadata, "grounding_chunks", None) or []:
            web = getattr(chunk, "web", None)
            if web is not None and getattr(web, "uri", None):
                sources.append(web.uri)
    return response.text, sources


# ═══════════════════════════════════════════════════════════════════════════════
# COMMAND IMPLEMENTATIONS
# ═══════════════════════════════════════════════════════════════════════════════


async def _research_query(
    input: ResearchQueryInput, context: Any = None
) -> CommandResult[ResearchQueryOutput]:
    """
    Perform a grounded web search using Gemini with Google Search integration.
    """
    # Check for API key
    api_key = get_gemini_api_key()
    if not api_key:
        return error(
            code="API_KEY_MISSING",
            message="GEMINI_API_KEY not found in environment",
            suggestion="Add GEMINI_API_KEY to desktop/.env file. See .env.example for details.",
        )

    # Check for google-genai package
    if not _check_genai_available():
        return error(
            code="PACKAGE_MISSING",
            message="google-genai package not installed",
            suggestion="Install with: pip install google-genai  OR  pip install mechanic-desktop[research]",
        )

    model_name = SEARCH_MODELS.get(input.mode, SEARCH_MODELS["fast"])

    # Build the prompt
    full_prompt = input.query
    if input.json_output:
        full_prompt += """

IMPORTANT: Your response MUST be valid JSON matching this schema:
{
  "summary": "A concise answer to the query",
  "key_points": [
    {
      "point": "Key finding or fact",
      "source": "Source URL or description"
    }
  ],
  "sources": ["URL1", "URL2"]
}
Do not include any text outside the JSON block."""

    try:
        result_text, sources = await asyncio.wait_for(
            asyncio.to_thread(
                _generate_grounded, api_key, model_name, full_prompt, input.mode
            ),
            timeout=REQUEST_TIMEOUT_SECONDS,
        )

        if input.json_output:
            result_text = _extract_json_from_response(result_text)

        return success(
            data=ResearchQueryOutput(
                answer=result_text,
                mode=input.mode,
                sources=sources[:10],  # Limit to 10 sources
            ),
            reasoning=f"Completed {input.mode} search using {model_name}",
            sources=[
                create_source(
                    type="api", id="gemini", title=f"Gemini {input.mode.title()} Search"
                )
            ],
            confidence=0.85,
        )

    except asyncio.TimeoutError:
        return error(
            code="SEARCH_TIMEOUT",
            message=f"Grounded search did not finish within {REQUEST_TIMEOUT_SECONDS} seconds",
            suggestion="Try the 'fast' mode or a narrower query.",
        )
    except Exception as e:
        return error(
            code="SEARCH_FAILED",
            message=f"Grounded search failed: {str(e)}",
            suggestion="Check your API key and network connection. Try again in a few seconds.",
        )


# ═══════════════════════════════════════════════════════════════════════════════
# REGISTRATION
# ═══════════════════════════════════════════════════════════════════════════════


def register_commands(server):
    """Register research commands with the AFD server."""

    server.command(
        name="research.query",
        description="Search the web for addon development information using Gemini with Google Search grounding",
        input_schema=ResearchQueryInput,
        output_schema=ResearchQueryOutput,
    )(_research_query)
