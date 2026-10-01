"""Additional WoW roots: a second install (for example on another drive) is discovered."""

import json
import os
from pathlib import Path

import pytest
from mechanic import config


def use_config_file(monkeypatch, tmp_path: Path, body) -> None:
    path = tmp_path / "config.json"
    path.write_text(json.dumps(body), encoding="utf-8")
    monkeypatch.setattr(config, "get_config_paths", lambda: [path])
    config.MechanicConfig.reset()


def install(root: Path, flavor: str = "_classic_beta_", account: str = "ACC") -> Path:
    sv = root / flavor / "WTF" / "Account" / account / "SavedVariables"
    sv.mkdir(parents=True)
    (sv / "!Mechanic.lua").write_text("MechanicDB = {}\n", encoding="utf-8")
    return sv


def test_unset_means_no_additional_roots():
    assert config.get_config().additional_wow_roots == []


def test_config_file_lists_additional_roots(monkeypatch, tmp_path):
    extra = tmp_path / "D" / "World of Warcraft"
    use_config_file(monkeypatch, tmp_path, {"additional_wow_roots": [str(extra)]})

    cfg = config.get_config()

    assert cfg.additional_wow_roots == [extra]
    assert extra in cfg.all_wow_roots()
    assert cfg.to_dict()["additional_wow_roots"] == [str(extra)]


def test_environment_overrides_the_config_file(monkeypatch, tmp_path):
    from_file = tmp_path / "from-file"
    first, second = tmp_path / "one", tmp_path / "two"
    use_config_file(monkeypatch, tmp_path, {"additional_wow_roots": [str(from_file)]})
    monkeypatch.setenv(
        "MECHANIC_ADDITIONAL_WOW_ROOTS", os.pathsep.join([str(first), "", str(second)])
    )
    config.MechanicConfig.reset()

    assert config.get_config().additional_wow_roots == [first, second]


@pytest.mark.parametrize(
    "value", ["not-a-list", {"a": 1}, 7, None, [None, 3, "", "   ", ["nested"]]]
)
def test_malformed_values_are_ignored(monkeypatch, tmp_path, value):
    use_config_file(monkeypatch, tmp_path, {"additional_wow_roots": value})

    assert config.get_config().additional_wow_roots == []


def test_all_wow_roots_orders_primary_first_and_drops_duplicates(monkeypatch, tmp_path):
    primary = tmp_path / "primary"
    extra = tmp_path / "extra"
    common = tmp_path / "common"
    primary.mkdir()
    (primary / "_retail_").mkdir()
    use_config_file(
        monkeypatch,
        tmp_path,
        {"wow_root": str(primary), "additional_wow_roots": [str(extra), str(primary)]},
    )
    monkeypatch.setattr(config, "get_common_wow_roots", lambda: [common, extra])
    monkeypatch.delenv("MECHANIC_WOW_ROOT")
    config.MechanicConfig.reset()

    assert config.get_config().all_wow_roots() == [primary, extra, common]


def test_discovery_finds_saved_variables_in_an_additional_install(
    monkeypatch, tmp_path
):
    extra = tmp_path / "D" / "World of Warcraft"
    sv = install(extra)
    use_config_file(monkeypatch, tmp_path, {"additional_wow_roots": [str(extra)]})

    assert sv in config.discover_saved_variables()


def test_discovery_ignores_a_missing_additional_root(monkeypatch, tmp_path):
    use_config_file(
        monkeypatch, tmp_path, {"additional_wow_roots": [str(tmp_path / "gone")]}
    )

    assert config.discover_saved_variables() == []


def test_discovery_without_the_setting_does_not_see_the_install(monkeypatch, tmp_path):
    extra = tmp_path / "D" / "World of Warcraft"
    install(extra)
    config.MechanicConfig.reset()

    assert config.discover_saved_variables() == []
