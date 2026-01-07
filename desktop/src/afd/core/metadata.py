"""Metadata types for UX-enabling command results.

These types enable rich agent UX by providing:
- Source attribution (where did this info come from?)
- Plan visualization (what steps will be taken?)
- Alternatives (what other options exist?)
- Warnings (what should the user be aware of?)

Example:
    >>> from afd.core.metadata import Source, create_source
    >>> 
    >>> source = create_source(
    ...     "document",
    ...     id="style-guide-v3",
    ...     title="Microsoft Style Guide",
    ...     location="Chapter 3.2",
    ... )
"""

from enum import Enum
from typing import Any, Generic, List, Optional, TypeVar

from pydantic import BaseModel, Field

T = TypeVar("T")


class Source(BaseModel):
    """Information source used by a command to produce its result.
    
    Enables: Attribution, verification, trust building.
    
    Attributes:
        type: Source type identifier (document, url, database, api, etc.).
        id: Unique identifier for the source.
        title: Human-readable title for display.
        url: URL if the source is web-accessible.
        location: Specific location within source (page, section, line).
        accessed_at: ISO timestamp when source was accessed.
        relevance: Confidence or relevance score (0-1).
    
    Example:
        >>> source = Source(
        ...     type="document",
        ...     id="style-guide-v3",
        ...     title="Microsoft Style Guide",
        ...     location="Chapter 3.2 - Capitalization",
        ... )
    """

    type: str
    id: Optional[str] = None
    title: Optional[str] = None
    url: Optional[str] = None
    location: Optional[str] = None
    accessed_at: Optional[str] = None
    relevance: Optional[float] = Field(default=None, ge=0, le=1)


class PlanStepStatus(str, Enum):
    """Possible statuses for a plan step."""

    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETE = "complete"
    FAILED = "failed"
    SKIPPED = "skipped"


class PlanStep(BaseModel):
    """A step in a multi-step plan or operation.
    
    Enables: Plan visualization, progress tracking, transparency.
    
    Attributes:
        id: Unique identifier for this step.
        action: The action being performed (verb: fetch, validate, etc.).
        status: Current status of this step.
        description: Human-readable description of what this step does.
        depends_on: IDs of steps that must complete before this one.
        result: Result data if the step is complete.
        error: Error information if the step failed.
        progress: Progress percentage (0-100) if in progress.
        estimated_time_remaining_ms: Estimated time remaining in ms.
    
    Example:
        >>> step = PlanStep(
        ...     id="validate-input",
        ...     action="validate",
        ...     status=PlanStepStatus.IN_PROGRESS,
        ...     description="Validate document format and content",
        ...     progress=50,
        ... )
    """

    id: str
    action: str
    status: PlanStepStatus = PlanStepStatus.PENDING
    description: Optional[str] = None
    depends_on: Optional[List[str]] = None
    result: Optional[Any] = None
    error: Optional[dict[str, str]] = None  # {code, message}
    progress: Optional[int] = Field(default=None, ge=0, le=100)
    estimated_time_remaining_ms: Optional[int] = None


class Alternative(BaseModel, Generic[T]):
    """An alternative result that was considered but not chosen.
    
    Enables: User choice, exploration, transparency about decisions.
    
    Attributes:
        data: The alternative result data.
        reason: Why this wasn't selected, or why user might prefer it.
        confidence: Confidence score for this alternative (0-1).
        label: Display label (e.g., "Formal", "Concise", "Detailed").
    
    Example:
        >>> alt: Alternative[str] = Alternative(
        ...     data="More formal version of the text...",
        ...     reason="More formal tone, suitable for business",
        ...     confidence=0.72,
        ...     label="Formal",
        ... )
    """

    data: T
    reason: str
    confidence: Optional[float] = Field(default=None, ge=0, le=1)
    label: Optional[str] = None


class WarningSeverity(str, Enum):
    """Severity levels for warnings."""

    INFO = "info"
    WARNING = "warning"
    CAUTION = "caution"


class Warning(BaseModel):
    """A non-fatal warning or notice to surface to the user.
    
    Enables: Proactive transparency, awareness of potential issues.
    
    Attributes:
        code: Machine-readable warning code (SCREAMING_SNAKE_CASE).
        message: Human-readable warning message.
        severity: Severity level for UI treatment.
        details: Additional context or details.
    
    Example:
        >>> warning = Warning(
        ...     code="OUTDATED_SOURCE",
        ...     message="The style guide used is 6 months old",
        ...     severity=WarningSeverity.INFO,
        ... )
    """

    code: str
    message: str
    severity: Optional[WarningSeverity] = WarningSeverity.WARNING
    details: Optional[dict[str, Any]] = None


# ═══════════════════════════════════════════════════════════════════════════════
# HELPER FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════


def create_source(
    type: str,
    *,
    id: Optional[str] = None,
    title: Optional[str] = None,
    url: Optional[str] = None,
    location: Optional[str] = None,
    accessed_at: Optional[str] = None,
    relevance: Optional[float] = None,
) -> Source:
    """Create a new Source.
    
    Args:
        type: Source type identifier.
        id: Unique identifier for the source.
        title: Human-readable title.
        url: Web URL if applicable.
        location: Specific location within source.
        accessed_at: ISO timestamp of access.
        relevance: Relevance score (0-1).
        
    Returns:
        A Source instance.
    
    Example:
        >>> source = create_source(
        ...     "document",
        ...     id="doc-123",
        ...     title="User Manual",
        ... )
    """
    return Source(
        type=type,
        id=id,
        title=title,
        url=url,
        location=location,
        accessed_at=accessed_at,
        relevance=relevance,
    )


def create_step(
    id: str,
    action: str,
    description: Optional[str] = None,
) -> PlanStep:
    """Create a new PlanStep with pending status.
    
    Args:
        id: Unique identifier for the step.
        action: The action being performed (verb).
        description: Human-readable description.
        
    Returns:
        A PlanStep with status=pending.
    
    Example:
        >>> step = create_step("fetch-data", "fetch", "Retrieve user data")
        >>> step.status
        <PlanStepStatus.PENDING: 'pending'>
    """
    return PlanStep(
        id=id,
        action=action,
        status=PlanStepStatus.PENDING,
        description=description,
    )


def update_step_status(
    step: PlanStep,
    status: PlanStepStatus,
    *,
    result: Optional[Any] = None,
    error: Optional[dict[str, str]] = None,
    progress: Optional[int] = None,
) -> PlanStep:
    """Update a PlanStep's status and optionally its result/error.
    
    Args:
        step: The step to update.
        status: New status value.
        result: Result data if completing successfully.
        error: Error info if failing.
        progress: Progress percentage if in progress.
        
    Returns:
        A new PlanStep with updated values.
    
    Example:
        >>> step = create_step("fetch", "fetch")
        >>> step = update_step_status(step, PlanStepStatus.COMPLETE, result={"data": "..."})
    """
    return PlanStep(
        id=step.id,
        action=step.action,
        status=status,
        description=step.description,
        depends_on=step.depends_on,
        result=result if status == PlanStepStatus.COMPLETE else step.result,
        error=error if status == PlanStepStatus.FAILED else step.error,
        progress=progress if status == PlanStepStatus.IN_PROGRESS else step.progress,
        estimated_time_remaining_ms=step.estimated_time_remaining_ms,
    )


def create_warning(
    code: str,
    message: str,
    severity: WarningSeverity = WarningSeverity.WARNING,
    details: Optional[dict[str, Any]] = None,
) -> Warning:
    """Create a new Warning.
    
    Args:
        code: Machine-readable warning code.
        message: Human-readable warning message.
        severity: Severity level for UI treatment.
        details: Additional context.
        
    Returns:
        A Warning instance.
    
    Example:
        >>> warning = create_warning(
        ...     "DEPRECATED_API",
        ...     "This API will be removed in v2.0",
        ...     WarningSeverity.CAUTION,
        ... )
    """
    return Warning(
        code=code,
        message=message,
        severity=severity,
        details=details,
    )
