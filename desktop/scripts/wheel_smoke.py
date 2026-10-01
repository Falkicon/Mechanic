"""Smoke-test the installed Mechanic wheel and packaged dashboard asset.

This script must run from an environment where the wheel has been installed;
it intentionally imports only standard-library modules before creating an
isolated home/data directory.  That keeps the check useful in CI and prevents
the package import from creating a real ``~/.mechanic`` database.
"""

from __future__ import annotations

import json
import os
import subprocess
import sys
import tempfile
from importlib.metadata import version
from pathlib import Path

# ``desktop/`` of the checkout this script runs from (its sources are only used
# to learn which files the installed wheel must contain).
SOURCE_ROOT = Path(__file__).resolve().parent.parent


def main() -> int:
    with tempfile.TemporaryDirectory(prefix="mechanic-wheel-smoke-") as sandbox:
        root = Path(sandbox)
        home = root / "home"
        home.mkdir()
        os.environ.update(
            {
                "HOME": str(home),
                "USERPROFILE": str(home),
                "XDG_CONFIG_HOME": str(root / "config"),
                "MECHANIC_DATA_DIR": str(root / "data"),
                "MECHANIC_WOW_ROOT": str(root / "missing-wow"),
                "MECHANIC_DEV_PATH": str(root / "missing-dev"),
            }
        )

        import mechanic
        from importlib.resources import files

        package_path = Path(mechanic.__file__).resolve()
        assert package_path.is_relative_to(Path(sys.prefix).resolve()), package_path
        assert mechanic.__version__ == version("mechanic-desktop")
        dashboard = files("mechanic.dashboard").joinpath("index.html")
        html = dashboard.read_text(encoding="utf-8")
        assert "<!DOCTYPE html>" in html
        assert "Mechanic" in html
        schema_form = files("mechanic.dashboard").joinpath("schema-form.js")
        assert "MechanicSchemaForm" in schema_form.read_text(encoding="utf-8")

        from fastapi.testclient import TestClient
        from mechanic.server import app

        # The application intentionally restricts Host to local browser
        # origins; TestClient's default ``testserver`` host is therefore not
        # representative of a supported deployment.
        client = TestClient(app, base_url="http://localhost")
        root_response = client.get("/")
        assert root_response.status_code == 200, root_response.text
        assert root_response.json()["ui"] == "/dashboard/"
        dashboard_response = client.get("/dashboard/")
        assert dashboard_response.status_code == 200, dashboard_response.text
        assert "Mechanic" in dashboard_response.text
        schema_response = client.get("/dashboard/schema-form.js")
        assert schema_response.status_code == 200, schema_response.text
        assert "MechanicSchemaForm" in schema_response.text

        # Every dashboard asset of the source tree must ship and be served with
        # a sensible content type.
        expected_types = {".js": "javascript", ".css": "text/css", ".html": "text/html"}
        source_dashboard = SOURCE_ROOT / "dashboard"
        assets = sorted(
            p.name for p in source_dashboard.iterdir() if p.suffix in expected_types
        )
        assert {"index.html", "dashboard.css", "schema-form.js"} <= set(assets), assets
        for name in assets:
            assert files("mechanic.dashboard").joinpath(name).is_file(), name
            response = client.get(f"/dashboard/{name}")
            assert response.status_code == 200, (name, response.status_code)
            kind = expected_types[Path(name).suffix]
            assert kind in response.headers["content-type"], (
                name,
                response.headers["content-type"],
            )

        health = client.get("/health").json()
        assert health["status"] == "healthy", health
        assert health["version"] == mechanic.__version__, health
        assert "port" in health, health

        # Runtime data files must be packaged rather than found next to a checkout.
        from mechanic.resources import resource_path

        resource_dir = SOURCE_ROOT / "src" / "mechanic" / "resources"
        packaged = sorted(
            p.name for p in resource_dir.iterdir() if p.suffix in {".lua", ".json"}
        )
        assert "checksums.json" in packaged, packaged
        for name in packaged:
            assert resource_path(name).is_file(), f"missing packaged resource {name}"
            assert not resource_path(name).resolve().is_relative_to(SOURCE_ROOT), name

        # The installed entry point must start, and --help must not create history.
        data_dir = Path(os.environ["MECHANIC_DATA_DIR"])
        help_run = subprocess.run(
            [sys.executable, "-m", "mechanic.cli", "--help"],
            capture_output=True,
            text=True,
            timeout=120,
        )
        assert help_run.returncode == 0, help_run.stdout + help_run.stderr
        assert "Mechanic Desktop" in help_run.stdout, help_run.stdout
        assert not data_dir.exists(), "--help initialized the history database"

        setup_run = subprocess.run(
            [sys.executable, "-m", "mechanic.cli", "--json", "setup", "--verify"],
            capture_output=True,
            text=True,
            timeout=120,
        )
        assert setup_run.returncode == 0, setup_run.stdout + setup_run.stderr
        summary = json.loads(setup_run.stdout)
        assert summary["source_checkout"] is False, summary
        assert summary["tools"] and summary["tools"][0]["name"] != "error", summary

    print(
        "wheel smoke: installed import, dashboard assets, resources, CLI and HTTP routes passed"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
