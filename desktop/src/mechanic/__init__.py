"""
Mechanic Desktop - Local companion tool for WoW addon development.
"""

__version__ = "0.2.1"

from .config import get_config, find_addon_path, MechanicConfig

__all__ = ["get_config", "find_addon_path", "MechanicConfig", "__version__"]
