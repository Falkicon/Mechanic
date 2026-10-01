"""
Mechanic Desktop - Local companion tool for WoW addon development.
"""

# Single source of the package version; pyproject.toml reads it (dynamic version).
__version__ = "0.5.0"

from .config import get_config, find_addon_path, MechanicConfig

__all__ = ["get_config", "find_addon_path", "MechanicConfig", "__version__"]
