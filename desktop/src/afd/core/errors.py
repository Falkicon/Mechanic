"""Error types and factory functions for AFD commands.

Errors should be actionable - they tell the user what went wrong
AND what they can do about it.

Example:
    >>> from afd.core.errors import not_found_error, validation_error
    >>> 
    >>> # Specific error factories
    >>> err = not_found_error("Document", "doc-123")
    >>> err.code
    'NOT_FOUND'
    >>> 
    >>> # Generic error creation
    >>> err = create_error("CUSTOM_ERROR", "Something went wrong")
"""

from typing import Any, Optional, Union

from pydantic import BaseModel


class CommandError(BaseModel):
    """Structured error with recovery guidance.
    
    All errors should be actionable - users should know what to do next.
    
    Attributes:
        code: Machine-readable error code (SCREAMING_SNAKE_CASE).
        message: Human-readable error description.
        suggestion: What the user can do about this error.
        retryable: Whether retrying the same request might succeed.
        details: Additional technical details for debugging.
        cause: Original error that caused this error.
    
    Example:
        >>> error = CommandError(
        ...     code="RATE_LIMITED",
        ...     message="API rate limit exceeded",
        ...     suggestion="Wait 60 seconds and try again",
        ...     retryable=True,
        ...     details={"retry_after_seconds": 60},
        ... )
    """

    code: str
    message: str
    suggestion: Optional[str] = None
    retryable: Optional[bool] = None
    details: Optional[dict[str, Any]] = None
    cause: Optional[Union["CommandError", str]] = None


class ErrorCodes:
    """Standard error codes for common scenarios.
    
    Use these for consistency across AFD applications.
    
    Example:
        >>> from afd.core.errors import ErrorCodes
        >>> ErrorCodes.NOT_FOUND
        'NOT_FOUND'
    """

    # Validation Errors
    VALIDATION_ERROR = "VALIDATION_ERROR"
    INVALID_INPUT = "INVALID_INPUT"
    MISSING_REQUIRED_FIELD = "MISSING_REQUIRED_FIELD"
    INVALID_FORMAT = "INVALID_FORMAT"

    # Resource Errors
    NOT_FOUND = "NOT_FOUND"
    ALREADY_EXISTS = "ALREADY_EXISTS"
    CONFLICT = "CONFLICT"

    # Authorization Errors
    UNAUTHORIZED = "UNAUTHORIZED"
    FORBIDDEN = "FORBIDDEN"
    TOKEN_EXPIRED = "TOKEN_EXPIRED"

    # Rate Limiting
    RATE_LIMITED = "RATE_LIMITED"
    QUOTA_EXCEEDED = "QUOTA_EXCEEDED"

    # Network/Service Errors
    SERVICE_UNAVAILABLE = "SERVICE_UNAVAILABLE"
    TIMEOUT = "TIMEOUT"
    CONNECTION_ERROR = "CONNECTION_ERROR"

    # Internal Errors
    INTERNAL_ERROR = "INTERNAL_ERROR"
    NOT_IMPLEMENTED = "NOT_IMPLEMENTED"
    UNKNOWN_ERROR = "UNKNOWN_ERROR"

    # Command-specific
    COMMAND_NOT_FOUND = "COMMAND_NOT_FOUND"
    INVALID_COMMAND_ARGS = "INVALID_COMMAND_ARGS"
    COMMAND_CANCELLED = "COMMAND_CANCELLED"
    COMMAND_EXECUTION_ERROR = "COMMAND_EXECUTION_ERROR"


def create_error(
    code: str,
    message: str,
    *,
    suggestion: Optional[str] = None,
    retryable: Optional[bool] = None,
    details: Optional[dict[str, Any]] = None,
    cause: Optional[Union[CommandError, Exception, str]] = None,
) -> CommandError:
    """Create a CommandError with standard fields.
    
    Args:
        code: Machine-readable error code.
        message: Human-readable error description.
        suggestion: Recovery guidance.
        retryable: Whether retry might succeed.
        details: Additional debugging info.
        cause: Original error that caused this.
        
    Returns:
        A CommandError instance.
    
    Example:
        >>> err = create_error(
        ...     "CUSTOM_ERROR",
        ...     "Something went wrong",
        ...     suggestion="Try again later",
        ... )
    """
    cause_value: Optional[Union[CommandError, str]] = None
    if isinstance(cause, CommandError):
        cause_value = cause
    elif isinstance(cause, Exception):
        cause_value = str(cause)
    elif cause is not None:
        cause_value = cause

    return CommandError(
        code=code,
        message=message,
        suggestion=suggestion,
        retryable=retryable,
        details=details,
        cause=cause_value,
    )


def validation_error(
    message: str,
    *,
    details: Optional[dict[str, Any]] = None,
) -> CommandError:
    """Create a validation error.
    
    Args:
        message: Description of what validation failed.
        details: Field-specific validation errors.
        
    Returns:
        A CommandError with code VALIDATION_ERROR.
    
    Example:
        >>> err = validation_error(
        ...     "Title is required",
        ...     details={"field": "title", "constraint": "required"},
        ... )
    """
    return create_error(
        ErrorCodes.VALIDATION_ERROR,
        message,
        suggestion="Check the input and try again",
        retryable=False,
        details=details,
    )


def not_found_error(
    resource_type: str,
    resource_id: str,
) -> CommandError:
    """Create a not found error.
    
    Args:
        resource_type: Type of resource (e.g., "Document", "User").
        resource_id: ID that was not found.
        
    Returns:
        A CommandError with code NOT_FOUND.
    
    Example:
        >>> err = not_found_error("Document", "doc-123")
        >>> err.message
        "Document with ID 'doc-123' not found"
    """
    return create_error(
        ErrorCodes.NOT_FOUND,
        f"{resource_type} with ID '{resource_id}' not found",
        suggestion=f"Verify the {resource_type.lower()} ID exists and try again",
        retryable=False,
        details={"resource_type": resource_type, "resource_id": resource_id},
    )


def rate_limit_error(
    retry_after_seconds: Optional[int] = None,
) -> CommandError:
    """Create a rate limit error.
    
    Args:
        retry_after_seconds: When to retry, if known.
        
    Returns:
        A CommandError with code RATE_LIMITED.
    
    Example:
        >>> err = rate_limit_error(60)
        >>> err.suggestion
        'Wait 60 seconds and try again'
    """
    suggestion = (
        f"Wait {retry_after_seconds} seconds and try again"
        if retry_after_seconds
        else "Wait a moment and try again"
    )
    return create_error(
        ErrorCodes.RATE_LIMITED,
        "Rate limit exceeded",
        suggestion=suggestion,
        retryable=True,
        details={"retry_after_seconds": retry_after_seconds} if retry_after_seconds else None,
    )


def timeout_error(
    operation_name: str,
    timeout_ms: int,
) -> CommandError:
    """Create a timeout error.
    
    Args:
        operation_name: Name of the operation that timed out.
        timeout_ms: Timeout duration in milliseconds.
        
    Returns:
        A CommandError with code TIMEOUT.
    
    Example:
        >>> err = timeout_error("fetch_data", 5000)
        >>> "timed out" in err.message
        True
    """
    return create_error(
        ErrorCodes.TIMEOUT,
        f"Operation '{operation_name}' timed out after {timeout_ms}ms",
        suggestion="Try again with a simpler request or contact support if this persists",
        retryable=True,
        details={"operation_name": operation_name, "timeout_ms": timeout_ms},
    )


def internal_error(
    message: str,
    *,
    cause: Optional[Exception] = None,
) -> CommandError:
    """Create an internal error (use sparingly - prefer specific errors).
    
    Args:
        message: Error description.
        cause: Original exception that caused this.
        
    Returns:
        A CommandError with code INTERNAL_ERROR.
    
    Example:
        >>> try:
        ...     raise ValueError("oops")
        ... except Exception as e:
        ...     err = internal_error("Processing failed", cause=e)
    """
    return create_error(
        ErrorCodes.INTERNAL_ERROR,
        message,
        suggestion="Please try again. If this persists, contact support.",
        retryable=True,
        cause=cause,
    )


def wrap_error(error: Any) -> CommandError:
    """Wrap an unknown error in a CommandError.
    
    Use this to safely convert any exception to a CommandError.
    
    Args:
        error: Any error value (Exception, CommandError, or other).
        
    Returns:
        A CommandError wrapping the original error.
    
    Example:
        >>> try:
        ...     raise ValueError("Something went wrong")
        ... except Exception as e:
        ...     err = wrap_error(e)
        >>> err.code
        'INTERNAL_ERROR'
    """
    if isinstance(error, CommandError):
        return error

    if isinstance(error, Exception):
        return create_error(
            ErrorCodes.INTERNAL_ERROR,
            str(error),
            suggestion="Please try again. If this persists, contact support.",
            retryable=True,
            cause=error,
            details={"error_type": type(error).__name__},
        )

    return create_error(
        ErrorCodes.UNKNOWN_ERROR,
        str(error),
        suggestion="Please try again. If this persists, contact support.",
        retryable=True,
    )


def is_command_error(value: Any) -> bool:
    """Check if a value is a CommandError.
    
    Args:
        value: Any value to check.
        
    Returns:
        True if value is a CommandError instance.
    
    Example:
        >>> err = not_found_error("Doc", "123")
        >>> is_command_error(err)
        True
        >>> is_command_error({"code": "ERROR"})
        False
    """
    return isinstance(value, CommandError)
