---
name: k-apidefs
description: >
  How Mechanic's APIDefs (the offline WoW API database behind api.search,
  api.info and the in-game API tab) are generated and refreshed: api.populate,
  api.generate, api.refresh and api.download, the canonical Mechanic/UI/APIDefs
  tree, and the secret-value flags. Load when refreshing APIs after a patch.
  Triggers: APIDefs, api.refresh, api.populate, api.generate, api.download,
  wow-ui-source, API database, Midnight impact, refresh API definitions.
---

# APIDefs generation

`Mechanic/UI/APIDefs/` is the **only** APIDefs tree (the one `Mechanic.toc` loads through `UI\APIDefs\APIDefs.xml`). It is generated: never edit the files by hand. The same data serves `api.search`, `api.info`, `api.list`, `api.stats`, the sandbox stub generator and the in-game API tab.

## Pipeline

```
Blizzard_APIDocumentationGenerated (wow-ui-source or a Townlong Yak extract)
   --api.populate-->  api_database.json                (default: <data_dir>/api_database.json)
   --api.generate-->  Mechanic/UI/APIDefs/<namespace>.lua + APIDefs.xml
```

| Command | Use |
|---|---|
| `api.refresh(source_path)` | Normal case: populate + generate in one step. `source_path` is the wow-ui-source repo root or an extract |
| `api.populate(source_path, output_path?)` | Parse docs into the database only. Reports the detected `wow_version`, `api_count` and any `skipped_files` with reasons |
| `api.generate(database_path?, output_path?)` | Regenerate the Lua files from an existing database. `output_path` must be a folder named `APIDefs` unless `allow_any_output_dir=true` |
| `api.download(build_id, output_path?, refresh=true)` | Fetch a FrameXML build from Townlong Yak (digits-only build id), extract under `<data_dir>/framexml/<version>`, optionally refresh. Network; only when asked |

All are mutating commands: preview intent with the user, and use a scratch `output_path` (with `allow_any_output_dir` if needed) when experimenting so the committed tree is not touched. `api.populate` uses the packaged `resources/lua_dumper.lua` when a Lua 5.1 executable is available (`MECHANIC_LUA`, `desktop/bin`, or PATH; `tools.status` reports it).

## Refresh workflow

1. Get Blizzard's source for the build you want (a `wow-ui-source` checkout of `live` or `beta`, or `api.download`).
2. `api.refresh(source_path=...)`; read `api_count`, `namespace_count` and `skipped_files`.
3. Review the diff of `Mechanic/UI/APIDefs/`: a large, unexplained change in `api_count` means the parser or source changed, not the game.
4. Run the Lua checks and the desktop tests (run every `tests/*_regressions.lua` harness; the APIDefs tree is loaded through `Mechanic/UI/APIDefs/APIDefs.xml`).
5. Verify in game with the reload protocol ([using-mechanic](../using-mechanic/SKILL.md)): the API tab loads and lists the new build's APIs.
6. Record the source build in the CHANGELOG entry.

## Data semantics

- Each entry has `key`, `name`, `category`, `subcategory`, `funcPath`, `params`, `returns` and a secret-value classification `midnightImpact` (`NORMAL`, or `RESTRICTED` with `protected = true`).
- Only `SecretArguments = "NotAllowed"` marks an API `RESTRICTED`; `AllowedWhenUntainted` is `NORMAL`.
- Only functions are generated: widget script-object methods and events from the documentation are not global APIs. Entries carry `funcPath`, not a function reference, and the addon resolves the function at run time (check existence before calling).
- The API count depends on the build; the current number is whatever `api.stats` reports for the checkout.

Related: [s-research](../s-research/SKILL.md) (using the data), [k-desktop](../k-desktop/SKILL.md) (changing the commands), [k-mechanic](../k-mechanic/SKILL.md) (API tab).
