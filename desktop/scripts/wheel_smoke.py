"""Smoke-test the installed Mechanic wheel and packaged dashboard asset.

This script must run from an environment where the wheel has been installed;
it intentionally imports only standard-library modules before creating an
isolated home/data directory.  That keeps the check useful in CI and prevents
the package import from creating a real ``~/.mechanic`` database.
"""

from __future__ import annotations

import os
import sys
import tempfile
from importlib.metadata import version
from pathlib import Path


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

    print("wheel smoke: installed import, dashboard resource, and HTTP route passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
