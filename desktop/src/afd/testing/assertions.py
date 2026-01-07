"""
Assertion helpers for testing AFD commands.

These functions make it easy to write clear, concise assertions
about command results.

Example:
    >>> result = await create_user({"name": "Alice"})
    >>> data = assert_success(result)
    >>> assert data["id"] == 1
    >>> 
    >>> result = await create_user({})
    >>> error = assert_error(result, "VALIDATION_ERROR")
    >>> assert "name" in error.message
"""

from typing import Any, Dict, List, Optional, TypeVar, Union

from afd.core import (
    CommandResult,
    CommandError,
    is_success,
    is_failure,
    Source,
    PlanStep,
    Warning as AfdWarning,
    Alternative,
)

T = TypeVar("T")


def assert_success(
    result: Union[CommandResult[T], Dict[str, Any]],
    message: Optional[str] = None,
) -> T:
    """Assert that a command result is successful and return the data.
    
    This is the primary assertion for testing successful commands.
    It validates the result structure and returns the data for
    further assertions.
    
    Args:
        result: Command result to check (dict or CommandResult).
        message: Optional custom failure message.
    
    Returns:
        The data field from the result.
    
    Raises:
        AssertionError: If the result is not successful.
    
    Example:
        >>> result = await create_user({"name": "Alice"})
        >>> data = assert_success(result)
        >>> assert data["id"] == 1
        >>> assert data["name"] == "Alice"
    """
    # Handle dict results
    if isinstance(result, dict):
        success = result.get("success", False)
        data = result.get("data")
        error = result.get("error")
    else:
        success = result.success
        data = result.data
        error = result.error
    
    if not success:
        # Build informative error message
        if error:
            if isinstance(error, dict):
                error_msg = f"{error.get('code', 'UNKNOWN')}: {error.get('message', 'Unknown error')}"
            else:
                error_msg = f"{error.code}: {error.message}"
        else:
            error_msg = "Unknown error (no error details)"
        
        failure_msg = message or f"Expected success but got error: {error_msg}"
        raise AssertionError(failure_msg)
    
    return data  # type: ignore


def assert_error(
    result: Union[CommandResult[Any], Dict[str, Any]],
    expected_code: Optional[str] = None,
    message: Optional[str] = None,
) -> CommandError:
    """Assert that a command result is a failure and return the error.
    
    This is the primary assertion for testing error cases.
    Optionally validates the error code.
    
    Args:
        result: Command result to check.
        expected_code: Optional error code to validate.
        message: Optional custom failure message.
    
    Returns:
        The error from the result.
    
    Raises:
        AssertionError: If the result is not a failure, or if the
            error code doesn't match.
    
    Example:
        >>> result = await create_user({})
        >>> error = assert_error(result, "VALIDATION_ERROR")
        >>> assert "name" in error.message
    """
    # Handle dict results
    if isinstance(result, dict):
        success = result.get("success", False)
        error = result.get("error")
        data = result.get("data")
    else:
        success = result.success
        error = result.error
        data = result.data
    
    if success or error is None:
        failure_msg = message or f"Expected error but got success with data: {data}"
        raise AssertionError(failure_msg)
    
    # Convert dict error to CommandError if needed
    if isinstance(error, dict):
        error = CommandError(
            code=error.get("code", "UNKNOWN"),
            message=error.get("message", "Unknown error"),
            suggestion=error.get("suggestion"),
            details=error.get("details"),
            retryable=error.get("retryable", False),
        )
    
    if expected_code is not None and error.code != expected_code:
        failure_msg = message or f"Expected error code '{expected_code}' but got '{error.code}'"
        raise AssertionError(failure_msg)
    
    return error


def assert_has_confidence(
    result: Union[CommandResult[Any], Dict[str, Any]],
    min_confidence: float = 0.0,
    max_confidence: float = 1.0,
) -> float:
    """Assert that a result has a confidence value within range.
    
    Args:
        result: Command result to check.
        min_confidence: Minimum expected confidence (inclusive).
        max_confidence: Maximum expected confidence (inclusive).
    
    Returns:
        The confidence value.
    
    Raises:
        AssertionError: If confidence is missing or out of range.
    
    Example:
        >>> result = await analyze_text({"text": "Hello"})
        >>> confidence = assert_has_confidence(result, min_confidence=0.8)
        >>> assert confidence >= 0.8
    """
    confidence = result.get("confidence") if isinstance(result, dict) else result.confidence
    
    if confidence is None:
        raise AssertionError("Expected result to have confidence, but it was None")
    
    if not min_confidence <= confidence <= max_confidence:
        raise AssertionError(
            f"Expected confidence in [{min_confidence}, {max_confidence}] but got {confidence}"
        )
    
    return confidence


def assert_has_reasoning(
    result: Union[CommandResult[Any], Dict[str, Any]],
    contains: Optional[str] = None,
) -> str:
    """Assert that a result has reasoning and optionally check content.
    
    Args:
        result: Command result to check.
        contains: Optional substring that should be in the reasoning.
    
    Returns:
        The reasoning string.
    
    Raises:
        AssertionError: If reasoning is missing or doesn't contain
            the expected substring.
    
    Example:
        >>> result = await generate_summary({"text": long_text})
        >>> reasoning = assert_has_reasoning(result, contains="key points")
    """
    reasoning = result.get("reasoning") if isinstance(result, dict) else result.reasoning
    
    if reasoning is None:
        raise AssertionError("Expected result to have reasoning, but it was None")
    
    if contains is not None and contains not in reasoning:
        raise AssertionError(
            f"Expected reasoning to contain '{contains}' but got: {reasoning}"
        )
    
    return reasoning


def assert_has_sources(
    result: Union[CommandResult[Any], Dict[str, Any]],
    min_count: int = 1,
) -> List[Source]:
    """Assert that a result has sources and return them.
    
    Args:
        result: Command result to check.
        min_count: Minimum number of expected sources.
    
    Returns:
        List of sources.
    
    Raises:
        AssertionError: If sources are missing or below min_count.
    
    Example:
        >>> result = await search_docs({"query": "authentication"})
        >>> sources = assert_has_sources(result, min_count=2)
        >>> assert all(s.url for s in sources)
    """
    sources = result.get("sources") if isinstance(result, dict) else result.sources
    
    if sources is None:
        raise AssertionError("Expected result to have sources, but it was None")
    
    # Convert dicts to Source objects if needed
    converted_sources = []
    for s in sources:
        if isinstance(s, dict):
            converted_sources.append(Source(
                title=s.get("title", ""),
                url=s.get("url"),
                content=s.get("content"),
                relevance=s.get("relevance"),
            ))
        else:
            converted_sources.append(s)
    
    if len(converted_sources) < min_count:
        raise AssertionError(
            f"Expected at least {min_count} sources but got {len(converted_sources)}"
        )
    
    return converted_sources


def assert_has_plan(
    result: Union[CommandResult[Any], Dict[str, Any]],
    min_steps: int = 1,
) -> List[PlanStep]:
    """Assert that a result has a plan and return the steps.
    
    Args:
        result: Command result to check.
        min_steps: Minimum number of expected steps.
    
    Returns:
        List of plan steps.
    
    Raises:
        AssertionError: If plan is missing or has too few steps.
    
    Example:
        >>> result = await plan_migration({"from": "v1", "to": "v2"})
        >>> steps = assert_has_plan(result, min_steps=3)
        >>> assert steps[0].title == "Backup data"
    """
    plan = result.get("plan") if isinstance(result, dict) else result.plan
    
    if plan is None:
        raise AssertionError("Expected result to have plan, but it was None")
    
    # Convert dicts to PlanStep objects if needed
    converted_steps = []
    for step in plan:
        if isinstance(step, dict):
            converted_steps.append(PlanStep(
                id=step.get("id", ""),
                title=step.get("title", ""),
                description=step.get("description"),
                status=step.get("status", "pending"),
            ))
        else:
            converted_steps.append(step)
    
    if len(converted_steps) < min_steps:
        raise AssertionError(
            f"Expected at least {min_steps} plan steps but got {len(converted_steps)}"
        )
    
    return converted_steps


def assert_has_warnings(
    result: Union[CommandResult[Any], Dict[str, Any]],
    min_count: int = 1,
) -> List[AfdWarning]:
    """Assert that a result has warnings and return them.
    
    Args:
        result: Command result to check.
        min_count: Minimum number of expected warnings.
    
    Returns:
        List of warnings.
    
    Raises:
        AssertionError: If warnings are missing or below min_count.
    
    Example:
        >>> result = await deploy({"env": "production"})
        >>> warnings = assert_has_warnings(result)
        >>> assert any("deprecated" in w.message for w in warnings)
    """
    warnings = result.get("warnings") if isinstance(result, dict) else result.warnings
    
    if warnings is None:
        raise AssertionError("Expected result to have warnings, but it was None")
    
    # Convert dicts to Warning objects if needed
    converted_warnings = []
    for w in warnings:
        if isinstance(w, dict):
            converted_warnings.append(AfdWarning(
                code=w.get("code", ""),
                message=w.get("message", ""),
                severity=w.get("severity", "info"),
                details=w.get("details"),
            ))
        else:
            converted_warnings.append(w)
    
    if len(converted_warnings) < min_count:
        raise AssertionError(
            f"Expected at least {min_count} warnings but got {len(converted_warnings)}"
        )
    
    return converted_warnings


def assert_has_alternatives(
    result: Union[CommandResult[Any], Dict[str, Any]],
    min_count: int = 1,
) -> List[Alternative[Any]]:
    """Assert that a result has alternatives and return them.
    
    Args:
        result: Command result to check.
        min_count: Minimum number of expected alternatives.
    
    Returns:
        List of alternatives.
    
    Raises:
        AssertionError: If alternatives are missing or below min_count.
    
    Example:
        >>> result = await suggest_names({"context": "user service"})
        >>> alts = assert_has_alternatives(result, min_count=3)
        >>> assert all(a.reason for a in alts)
    """
    alternatives = result.get("alternatives") if isinstance(result, dict) else result.alternatives
    
    if alternatives is None:
        raise AssertionError("Expected result to have alternatives, but it was None")
    
    # Convert dicts to Alternative objects if needed
    converted_alts: List[Alternative[Any]] = []
    for alt in alternatives:
        if isinstance(alt, dict):
            converted_alts.append(Alternative(
                data=alt.get("data"),
                reason=alt.get("reason", ""),
                confidence=alt.get("confidence"),
            ))
        else:
            converted_alts.append(alt)
    
    if len(converted_alts) < min_count:
        raise AssertionError(
            f"Expected at least {min_count} alternatives but got {len(converted_alts)}"
        )
    
    return converted_alts
