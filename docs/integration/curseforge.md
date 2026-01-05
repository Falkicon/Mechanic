# CurseForge Deployment - Agent Documentation

Addons that use CurseForge for distribution require proper configuration and tagging workflow.

---

## GitHub Webhook Setup

CurseForge can automatically package and publish your addon when you push to GitHub. 

**Documentation**: https://support.curseforge.com/en/support/solutions/articles/9000197281-automatic-packaging

**Setup Steps:**

1. Go to your CurseForge project → **Integration** tab
2. Copy the **Push Token** (a UUID like `ca3777b9-f1c2-495a-91b0-d553a44ce46e`)
3. In your GitHub repo, go to **Settings → Webhooks → Add webhook**
4. Configure the webhook:
   - **Payload URL**: `https://www.curseforge.com/api/projects/{projectID}/package?token={token}`
   - **Content type**: `application/json`
   - **Events**: Just the push event
   - **Active**: Checked

**Example Payload URL:**
```
https://www.curseforge.com/api/projects/1409478/package?token=ca3777b9-f1c2-495a-91b0-d553a44ce46e
```

Once configured, every push to GitHub triggers CurseForge packaging automatically.

---

## Required Files

### .pkgmeta

The `.pkgmeta` file configures the CurseForge packager. Place it in the addon root directory.

**Minimal example:**

```yaml
package-as: AddonName

externals:
  Libs/LibStub: https://repos.curseforge.com/wow/libstub/trunk
  Libs/CallbackHandler-1.0: https://repos.curseforge.com/wow/callbackhandler/trunk/CallbackHandler-1.0
  Libs/AceAddon-3.0: https://repos.curseforge.com/wow/ace3/trunk/AceAddon-3.0
  # Add other libraries as needed

ignore:
  - README.md
  - .gitignore
  - .cursorignore
  - AGENTS.md
  - Docs
```

**Key sections:**
- `package-as`: The addon folder name in the package
- `externals`: Libraries fetched from CurseForge repos (ensures latest versions)
- `ignore`: Files/folders excluded from the release package

### .toc Version & Interface

The `.toc` file must have:

1. **Interface version** (required for loading):
```
## Interface: 120001, 120000
```
> Use multi-version format for broad compatibility. Current baseline: `120001, 120000`.

2. **Version line** (matches release tags):
```
## Version: 1.0.2
```

---

## Release Types

CurseForge determines release type based on git tags:

| Git Action | CurseForge Release | Version String |
|------------|-------------------|----------------|
| Push to main (no tag) | Alpha | `1.0.1-3-g6dde114-alpha` |
| Tag with `-alpha` suffix | Alpha | `1.0.2-alpha` |
| Tag with `-beta` suffix | Beta | `1.0.2-beta` |
| Clean tag (e.g., `v1.0.2`) | **Release** | `1.0.2` |

**Important:** Without a clean tag, CurseForge uses `git describe` to generate version strings like `1.0.1-3-g6dde114-alpha` (nearest tag + commits ahead + short hash + alpha suffix).

---

## Release Workflow

Use the `mech` CLI for the complete release workflow:

```bash
# Full release in one command (bump, changelog, commit, tag)
mech release MyAddon 1.0.2 "Description of changes"
```

This command chains:
1. `version.bump` - Updates `.toc` version
2. `changelog.add` - Adds entry to CHANGELOG.md
3. `git.commit` - Stages and commits changes
4. `git.tag` - Creates version tag

**After running `mech release`, push to trigger CurseForge:**

```bash
git push origin main
git push origin v1.0.2
```

**CRITICAL:** Always push the tag after pushing commits. The tag triggers the Release build on CurseForge.

### Tag Naming Convention

- Use `v` prefix for version tags: `v1.0.2`, `v2.0.0`
- For pre-releases: `v1.0.2-alpha`, `v1.0.2-beta`
- Tags must match `.toc` version (with or without `v` prefix)

---

## Troubleshooting

**Version shows as alpha with hash:**
- You haven't pushed a tag for the current version
- Solution: Create and push a clean tag matching your `.toc` version

**Package missing files:**
- Check `.pkgmeta` `ignore` section isn't excluding needed files
- Verify file paths in `.toc` are correct

**Externals not updating:**
- CurseForge caches externals; may take time to refresh
- Verify external URLs are correct CurseForge repo paths
