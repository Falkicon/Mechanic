"""
Centralized configuration for Mechanic Desktop.

Handles WoW installation discovery, addon path resolution, and user configuration.
All paths are determined dynamically - no hardcoded user-specific paths.
"""

import json
import os
import sys
from pathlib import Path
from typing import Dict, List, Optional, Any


# ═══════════════════════════════════════════════════════════════════════════════
# PATH DISCOVERY
# ═══════════════════════════════════════════════════════════════════════════════

def get_common_wow_roots() -> List[Path]:
    """
    Get common WoW installation paths based on the operating system.
    These are fallback locations to search if no config is provided.
    """
    if sys.platform == "win32":
        # Common Windows installation paths
        return [
            Path("C:/Program Files (x86)/World of Warcraft"),
            Path("C:/Program Files/World of Warcraft"),
            Path("D:/Games/World of Warcraft"),
            Path("D:/World of Warcraft"),
            Path("E:/Games/World of Warcraft"),
        ]
    elif sys.platform == "darwin":
        # macOS paths
        return [
            Path("/Applications/World of Warcraft"),
            Path.home() / "Applications" / "World of Warcraft",
        ]
    else:
        # Linux (Wine/Lutris)
        return [
            Path.home() / ".wine" / "drive_c" / "Program Files (x86)" / "World of Warcraft",
            Path.home() / "Games" / "World of Warcraft",
        ]


def get_config_paths() -> List[Path]:
    """Get possible config file locations in order of priority."""
    paths = []
    
    # 1. User home config (highest priority)
    paths.append(Path.home() / ".mechanic" / "config.json")
    
    # 2. XDG config on Linux/macOS
    if sys.platform != "win32":
        xdg_config = os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config")
        paths.append(Path(xdg_config) / "mechanic" / "config.json")
    
    # 3. Current working directory
    paths.append(Path.cwd() / "mechanic.config.json")
    
    return paths


def get_data_dir() -> Path:
    """Get the data directory for storing databases and cache."""
    # Check for user-specified data dir
    if "MECHANIC_DATA_DIR" in os.environ:
        return Path(os.environ["MECHANIC_DATA_DIR"])
    
    # Default: ~/.mechanic/data
    data_dir = Path.home() / ".mechanic" / "data"
    data_dir.mkdir(parents=True, exist_ok=True)
    return data_dir


# ═══════════════════════════════════════════════════════════════════════════════
# CONFIGURATION CLASS
# ═══════════════════════════════════════════════════════════════════════════════

class MechanicConfig:
    """
    Central configuration manager for Mechanic Desktop.
    
    Configuration is loaded from (in priority order):
    1. Environment variables (MECHANIC_*)
    2. User config file (~/.mechanic/config.json)
    3. Auto-discovered paths
    """
    
    _instance: Optional["MechanicConfig"] = None
    
    def __init__(self):
        self._config: Dict[str, Any] = {}
        self._wow_root: Optional[Path] = None
        self._dev_path: Optional[Path] = None
        self._loaded = False
    
    @classmethod
    def get(cls) -> "MechanicConfig":
        """Get the singleton config instance."""
        if cls._instance is None:
            cls._instance = cls()
            cls._instance._load()
        return cls._instance
    
    @classmethod
    def reset(cls):
        """Reset the singleton (useful for testing)."""
        cls._instance = None
    
    def _load(self):
        """Load configuration from file and environment."""
        if self._loaded:
            return
        
        # Load from config file
        for config_path in get_config_paths():
            if config_path.exists():
                try:
                    self._config = json.loads(config_path.read_text(encoding="utf-8"))
                    break
                except (json.JSONDecodeError, IOError):
                    continue
        
        # Override with environment variables
        if "MECHANIC_WOW_ROOT" in os.environ:
            self._config["wow_root"] = os.environ["MECHANIC_WOW_ROOT"]
        if "MECHANIC_DEV_PATH" in os.environ:
            self._config["dev_path"] = os.environ["MECHANIC_DEV_PATH"]
        
        self._loaded = True
    
    @property
    def wow_root(self) -> Optional[Path]:
        """
        Get the WoW installation root directory.
        
        Searches in order:
        1. Config file / environment variable
        2. Common installation paths
        """
        if self._wow_root is not None:
            return self._wow_root
        
        # Check config
        if "wow_root" in self._config:
            path = Path(self._config["wow_root"])
            if path.exists():
                self._wow_root = path
                return self._wow_root
        
        # Auto-discover
        for root in get_common_wow_roots():
            if root.exists():
                # Verify it's actually a WoW installation
                if (root / "_retail_").exists() or (root / "_classic_").exists():
                    self._wow_root = root
                    return self._wow_root
        
        return None
    
    @property
    def dev_path(self) -> Optional[Path]:
        """
        Get the development addons path (_dev_ folder).
        
        This is where source addons are stored for development.
        """
        if self._dev_path is not None:
            return self._dev_path
        
        # Check config
        if "dev_path" in self._config:
            path = Path(self._config["dev_path"])
            if path.exists():
                self._dev_path = path
                return self._dev_path
        
        # Default: wow_root/_dev_
        if self.wow_root:
            dev = self.wow_root / "_dev_"
            if dev.exists():
                self._dev_path = dev
                return self._dev_path
        
        return None
    
    @property
    def flavors(self) -> List[str]:
        """Get WoW flavors to target (e.g., _retail_, _beta_, _ptr_)."""
        return self._config.get("flavors", ["_retail_", "_beta_", "_ptr_"])
    
    @property
    def template_path(self) -> Optional[Path]:
        """Get the path to the addon template."""
        if "template_path" in self._config:
            path = Path(self._config["template_path"])
            if path.exists():
                return path
        
        # Default: Look for _TemplateAddon in dev_path or common locations
        if self.dev_path:
            # Check for !Mechanic/_TemplateAddon
            mechanic_template = self.dev_path / "!Mechanic" / "_TemplateAddon"
            if mechanic_template.exists():
                return mechanic_template
            
            # Check for standalone _TemplateAddon
            standalone = self.dev_path / "_TemplateAddon"
            if standalone.exists():
                return standalone
        
        return None
    
    @property
    def data_dir(self) -> Path:
        """Get the data directory for databases and cache."""
        return get_data_dir()
    
    def get_addon_search_paths(self) -> List[Path]:
        """
        Get all paths to search for addons.
        
        Returns paths in priority order:
        1. Configured dev_path
        2. wow_root/_dev_
        3. Any additional paths from config
        """
        paths = []
        
        # Primary dev path
        if self.dev_path:
            paths.append(self.dev_path)
        
        # Additional search paths from config
        for extra in self._config.get("addon_search_paths", []):
            path = Path(extra)
            if path.exists() and path not in paths:
                paths.append(path)
        
        return paths
    
    def to_dict(self) -> Dict[str, Any]:
        """Export current configuration as a dictionary."""
        return {
            "wow_root": str(self.wow_root) if self.wow_root else None,
            "dev_path": str(self.dev_path) if self.dev_path else None,
            "template_path": str(self.template_path) if self.template_path else None,
            "flavors": self.flavors,
            "data_dir": str(self.data_dir),
            "addon_search_paths": [str(p) for p in self.get_addon_search_paths()],
        }
    
    def save_user_config(self, config: Dict[str, Any]):
        """Save configuration to user config file."""
        config_path = Path.home() / ".mechanic" / "config.json"
        config_path.parent.mkdir(parents=True, exist_ok=True)
        config_path.write_text(json.dumps(config, indent=2), encoding="utf-8")
        
        # Reload
        self._loaded = False
        self._wow_root = None
        self._dev_path = None
        self._load()


# ═══════════════════════════════════════════════════════════════════════════════
# CONVENIENCE FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

def get_config() -> MechanicConfig:
    """Get the global config instance."""
    return MechanicConfig.get()


def find_addon_path(addon_name: str, override_path: Optional[str] = None) -> Optional[Path]:
    """
    Find the path to an addon folder.
    
    Prioritizes folders containing a .toc file (actual addon) over repo folders.
    Supports nested structures like: _dev_/MyAddon/MyAddon/MyAddon.toc
    
    Args:
        addon_name: Name of the addon to find
        override_path: Optional explicit path (takes priority)
        
    Returns:
        Path to the addon folder, or None if not found
    """
    # Explicit override takes priority
    if override_path:
        p = Path(override_path)
        if p.exists():
            return p
        return None
    
    config = get_config()
    candidates = []
    
    for search_path in config.get_addon_search_paths():
        if not search_path.exists():
            continue
        
        # Direct match (e.g., _dev_/MyAddon)
        addon_path = search_path / addon_name
        if addon_path.exists():
            candidates.append(addon_path)
        
        # Nested structure (e.g., _dev_/MyAddon/MyAddon)
        for subdir in search_path.iterdir():
            if subdir.is_dir():
                nested = subdir / addon_name
                if nested.exists():
                    candidates.append(nested)
    
    if not candidates:
        return None
    
    # Prioritize paths with .toc files (actual addons vs repo folders)
    for candidate in candidates:
        toc_file = candidate / f"{addon_name}.toc"
        if toc_file.exists():
            return candidate
    
    # Fall back to first match if no .toc found
    return candidates[0]


def discover_saved_variables() -> List[Path]:
    """
    Discover SavedVariables folders for accounts where !Mechanic is installed.
    
    Returns:
        List of paths to SavedVariables folders
    """
    config = get_config()
    found_paths = set()
    
    # Build list of WoW roots to search
    wow_roots = []
    if config.wow_root:
        wow_roots.append(config.wow_root)
    wow_roots.extend(get_common_wow_roots())
    
    flavors = config.flavors + ["_dev_"]
    
    for root in wow_roots:
        if not root.exists():
            continue
        
        for flavor in flavors:
            wtf_path = root / flavor / "WTF" / "Account"
            if not wtf_path.exists():
                continue
            
            try:
                for account_dir in wtf_path.iterdir():
                    if not account_dir.is_dir():
                        continue
                    
                    sv_path = account_dir / "SavedVariables"
                    if sv_path.exists():
                        # Check if !Mechanic is installed
                        if (sv_path / "!Mechanic.lua").exists():
                            found_paths.add(sv_path)
            except (PermissionError, OSError):
                continue
    
    return sorted(list(found_paths))
