"""CommandResult and helper functions for structured command responses.

All commands return a CommandResult with UX-enabling metadata following
Agent-First Development (AFD) principles.

Example:
    >>> from afd.core.result import success, error
    >>> 
    >>> # Successful result
    >>> result = success({"id": "123"}, reasoning="Created successfully")
    >>> assert result.success is True
    >>> 
    >>> # Error result  
    >>> result = error("NOT_FOUND", "Resource not found")
    >>> assert result.success is False
"""

from typing import Any, Generic, List, Optional, TypeVar

from pydantic import BaseModel, Field

from afd.core.metadata import Alternative, PlanStep, Source, Warning

T = TypeVar("T")


class ResultMetadata(BaseModel):
    """Execution metadata for debugging and monitoring.
    
    Attributes:
        execution_time_ms: Time taken to execute the command in milliseconds.
        command_version: Version of the command that produced this result.
        trace_id: Unique trace ID for debugging and correlation.
        timestamp: ISO timestamp when the command was executed.
    """

    model_config = {"extra": "allow"}  # Allow additional metadata fields

    execution_time_ms: Optional[float] = None
    command_version: Optional[str] = None
    trace_id: Optional[str] = None
    timestamp: Optional[str] = None


class CommandError(BaseModel):
    """Structured error with recovery guidance.
    
    All errors should be actionable - users should know what to do next.
    
    Attributes:
        code: Machine-readable error code (SCREAMING_SNAKE_CASE).
        message: Human-readable error description.
        suggestion: What the user can do about this error.
        retryable: Whether retrying might succeed.
        details: Additional technical details for debugging.
    
    Example:
        >>> error = CommandError(
        ...     code="RATE_LIMITED",
        ...     message="API rate limit exceeded",
        ...     suggestion="Wait 60 seconds and try again",
        ...     retryable=True,
        ... )
    """

    code: str
    message: str
    suggestion: Optional[str] = None
    retryable: Optional[bool] = None
    details: Optional[dict[str, Any]] = None


class CommandResult(BaseModel, Generic[T]):
    """Standard response type for all AFD commands.
    
    All commands return this structure, enabling consistent handling across
    CLI, MCP, and REST API surfaces.
    
    Attributes:
        success: Whether the command completed successfully.
        data: The command output (generic type T) when success=True.
        error: Structured error when success=False.
        confidence: Agent's confidence in this result (0-1).
        reasoning: Human-readable explanation of what happened.
        sources: Information sources used to produce this result.
        plan: Steps in a multi-step operation.
        alternatives: Other options the agent considered.
        warnings: Non-fatal warnings to surface to user.
        metadata: Execution metadata for debugging.
    
    Example:
        >>> result: CommandResult[dict] = CommandResult(
        ...     success=True,
        ...     data={"id": "123", "title": "My Document"},
        ...     confidence=0.95,
        ...     reasoning="Document created with all required fields",
        ... )
    """

    success: bool
    data: Optional[T] = None
    error: Optional[CommandError] = None

    # UX-enabling fields (AFD standard)
    confidence: Optional[float] = Field(default=None, ge=0, le=1)
    reasoning: Optional[str] = None
    sources: Optional[List[Source]] = None
    plan: Optional[List[PlanStep]] = None
    alternatives: Optional[List[Alternative[T]]] = None
    warnings: Optional[List[Warning]] = None
    
    # Execution metadata
    metadata: Optional[ResultMetadata] = None


def success(
    data: T,
    *,
    confidence: Optional[float] = None,
    reasoning: Optional[str] = None,
    sources: Optional[List[Source]] = None,
    plan: Optional[List[PlanStep]] = None,
    alternatives: Optional[List[Alternative[T]]] = None,
    warnings: Optional[List[Warning]] = None,
    metadata: Optional[ResultMetadata] = None,
) -> CommandResult[T]:
    """Create a successful command result.
    
    Args:
        data: The command output.
        confidence: Quality confidence score (0-1).
        reasoning: Human-readable explanation.
        sources: Information sources used.
        plan: Steps in multi-step operation.
        alternatives: Other options considered.
        warnings: Non-fatal warnings.
        metadata: Execution metadata.
        
    Returns:
        CommandResult with success=True.
    
    Example:
        >>> result = success(
        ...     data={"id": "123"},
        ...     reasoning="Created successfully",
        ...     confidence=0.95,
        ... )
    """
    return CommandResult(
        success=True,
        data=data,
        confidence=confidence,
        reasoning=reasoning,
        sources=sources,
        plan=plan,
        alternatives=alternatives,
        warnings=warnings,
        metadata=metadata,
    )


def failure(
    err: CommandError,
    *,
    warnings: Optional[List[Warning]] = None,
    metadata: Optional[ResultMetadata] = None,
) -> CommandResult[Any]:
    """Create a failed command result from a CommandError.
    
    Args:
        err: The error details.
        warnings: Non-fatal warnings to include.
        metadata: Execution metadata.
        
    Returns:
        CommandResult with success=False.
    
    Example:
        >>> from afd.core.errors import not_found_error
        >>> result = failure(not_found_error("Document", "doc-123"))
    """
    return CommandResult(
        success=False,
        error=err,
        warnings=warnings,
        metadata=metadata,
    )


def error(
    code: str,
    message: str,
    *,
    suggestion: Optional[str] = None,
    retryable: Optional[bool] = None,
    details: Optional[dict[str, Any]] = None,
) -> CommandResult[Any]:
    """Create an error command result.
    
    This is a convenience function that creates both the CommandError
    and wraps it in a failed CommandResult.
    
    Args:
        code: Error code (e.g., "NOT_FOUND", "VALIDATION_ERROR").
        message: Human-readable error description.
        suggestion: Recovery guidance for the user.
        retryable: Whether retrying might succeed.
        details: Additional technical details.
        
    Returns:
        CommandResult with success=False.
    
    Example:
        >>> result = error(
        ...     "NOT_FOUND",
        ...     "Document not found",
        ...     suggestion="Check the document ID and try again",
        ... )
    """
    return CommandResult(
        success=False,
        error=CommandError(
            code=code,
            message=message,
            suggestion=suggestion,
            retryable=retryable,
            details=details,
        ),
    )


def is_success(result: CommandResult[T]) -> bool:
    """Check if a result is successful.
    
    Args:
        result: The CommandResult to check.
        
    Returns:
        True if success=True and data is present.
    
    Example:
        >>> result = success({"id": "123"})
        >>> is_success(result)
        True
    """
    return result.success is True and result.data is not None


def is_failure(result: CommandResult[T]) -> bool:
    """Check if a result is a failure.
    
    Args:
        result: The CommandResult to check.
        
    Returns:
        True if success=False and error is present.
    
    Example:
        >>> result = error("NOT_FOUND", "Not found")
        >>> is_failure(result)
        True
    """
    return result.success is False and result.error is not None
