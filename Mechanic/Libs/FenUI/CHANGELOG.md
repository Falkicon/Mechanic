# Changelog

All notable changes to FenUI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).


## [Unreleased]

Visual polish and quality pass, then the Obsidian aesthetic pass.

### Changed (Obsidian)
- **New default palette "Obsidian"** - neutral near-black surfaces (new `obsidian*` primitives) with gold as the single accent. Semantic tokens were repointed, so existing widgets and consumer addons pick it up automatically. The old warm-grey values remain as primitives and as the new `Classic` theme. The Default theme no longer overrides tokens.
- New semantic tokens: `surfaceHeader`, `surfaceControl`/`Hover`/`Pressed`, `textStrong`, `textTitle`, `borderInteractiveHover`, `surfaceRowSelectedHover`, `accentBar`. `textHeading` is now neutral (gold is reserved for `textTitle`); `surfaceRowSelected` is a translucent gold wash.
- **Buttons** - neutral secondary style by default (light label on a control surface); new `variant = "primary"` (gold fill, dark label) and `Button:SetVariant()`.
- **Tabs** - muted labels at rest, hover wash, gold label + underline only for the selected tab, on a hairline baseline across the strip (`showBaseline = false` to hide).
- **Rows** (Tree, Grid, VirtualList) - selection is a gold wash with a 2px gold leading edge.
- **Panel** - raised title strip with a hairline divider, soft drop shadow by default (`shadow = false` to opt out), gold title.
- **ScrollBar** - thin 6px thumb floating in a 14px gutter on a transparent track (`scrollBarWidth` 20 → 14, new `scrollThumbWidth`).
- **Input** - control border at rest, lighter on hover, gold on focus; token text/placeholder colors.
- **Checkbox** - recessed box, gold edge when checked. **Dropdown** - left-aligned value label and a chevron.
- **Fonts** - `fontBody`/`fontSmall`/`fontHeading` now use Blizzard's white `GameFontHighlight*` family (gold `GameFontNormal*` is kept for `fontTitle` and the Classic theme via new `bodyGold`/`bodySmallGold`/`headingGold` primitives). Labels that relied on the gold default, such as Grid cells and MultiLineEditBox text, now render white.
- **SplitLayout** nav items use the row selection style (gold wash + leading edge) with neutral labels instead of gold.

- **Type scale** - new `FenUIFont*` font objects (caption 10, small 11, body 12, heading 14, title 16, display 20) back the font tokens; new `fontCaption`, `fontWindowTitle`, `fontDisplay` tokens; `fontTitle` is now the 16px page title (the window title uses `fontWindowTitle`, 14px).
- **Rounded corners** - buttons, inputs, dropdowns and checkboxes use `radiusControl` (3px); `ModernDark` windows and the new `Card` border pack (now the `CreateCard` default) use `radiusContainer` (6px). The Panel title strip follows the rounded top corners. Rows, tabs and dividers stay square.

- **Asset paths** - `FenUI.ADDON_PATH` kept a leading `[` on clients whose `debugstack` uses the `[path]:line` format (e.g. WoW: Forever), and extensionless asset paths only resolve `.blp`/`.tga` there. FenUI's PNG assets (shadows, glows, corners) now load: path detection handles that format and asset paths include `.png`.
- **Drop shadow** - redrawn `shadow-soft-64.png` (fully transparent border, smooth falloff); shadow textures now draw on the background frame's lowest sublevel so they can't tie with or cover the window on low frame levels; the center piece is no longer drawn; Panel's default shadow is a centered ambient shadow (size 24, alpha 0.55).

### Added (Obsidian)
- `FenUI:CreateRoundedShape`, `FenUI:CreateRoundedBox`, `FenUI:GetRadius`, and the `Assets/corner-disc-64.png` corner asset. **New asset: restart the WoW client once** (a `/reload` can't see files added while the game is running).
- `FenUI:SkinScrollFrame(scrollFrame, { offset })` restyles a Blizzard `UIPanelScrollFrameTemplate` to match (arrow buttons removed, thin token thumb, thumb hidden when nothing scrolls).

### Fixed
- **Token chains resolved to white** - Semantic tokens that point at other semantic tokens (`textEmptyTitle`, `textEmptySubtitle`, all `background*` tokens) fell through to pure white. `GetColor`/`GetSpacing`/`GetFont` now follow the chain (with a cycle guard), so EmptyState text renders in its intended muted colors.
- **Crisp 1px borders** - The border engine, Button, Checkbox, Input, Toolbar/StatusRow dividers and the SplitLayout separator snap hairlines to whole physical pixels (`PixelUtil`); border-engine frames re-snap on UI scale/resolution changes.
- **Drop shadows** - Offset math shrank the shadow instead of shifting it; the shadow now hides/fades with its frame, switches blend mode correctly between shadow and glow, supports `"glowHard"`, and no longer applies alpha twice. Switching shadow types clears the previous one.
- **Inner shadow** drew over the border and margin; it now sits inside the background, under the border, and honors `size`/`alpha` on every call.
- **Stack** initialized its Layout twice (duplicate background frame, doubled inner-shadow opacity).
- **Group** errored when given a `name` (called a nonexistent `SetName`).
- **Scrolling** - Hidden scrollbars kept their old range, so the mouse wheel scrolled lists into blank space; ScrollPanel no longer runs an endless 0.1s retry timer when its content is empty; thumb held its hover color while dragging; nil config no longer errors.
- **VirtualList** reserved 12px for a 20px scrollbar (rows ran under it); header rows no longer show hover.
- **Tree** kept selection on the pooled row frame, so a different node could appear selected after `SetData`; hover painted over the selection; clicking a value-less group node called `onSelect(nil)`. Added `Tree:Select(value, silent)` / `GetSelected()`.
- **Grid** rows carried a stale selection after re-binding.
- **Panel** subtitle used a nonexistent `textSubtle` token (rendered white); close button used DIALOG strata (floated above other windows) and hardcoded colors; `SetPadding` ignored token strings; long titles now truncate before the close button.
- **Tabs** - `GetBadge()` errored for texture badges; icon badges were tinted green; badges could spill past the tab edge; disabling the selected tab left stale selection state (selection now moves to the first enabled tab); default group height matches `tabHeight`.
- **MultiLineEditBox** - Read-only text could be edited with Tab; `Clear()` was undone on the next keypress in read-only mode; the view now follows the cursor; read-only reverts keep scroll position and caret; width matches the real viewport.
- **Dropdown** menus opened at the cursor instead of under the control (and didn't close with it); nil config no longer errors.
- **Checkbox** checkmark used a "✓" glyph missing from WoW fonts; now an atlas (FontString calls like `SetFontObject`/`SetTextColor` on it are still accepted for compatibility). The label row is clickable and shares the hover state.
- **Buttons** with a fixed width truncate long labels instead of overflowing; auto-sized widgets round to whole pixels.
- **Toolbar** force-showed every item on each layout (items couldn't be hidden); it now skips hidden items and reflows when items show/hide/resize.
- **EmptyState** sized itself from the parent's width at creation (usually 0); it now stretches with its container and re-measures wrapped text.
- **InfoPanel** reserved the close-button space twice; **SplitLayout** `GetContentFrame()` without a key errored inside Layout internals.
- `/fenui debug` errored when FenUI is embedded (`FenUIDB` was never initialized); `FenUI.VERSION` now matches the TOC; the saved theme's token overrides are re-applied on load; `Utils:Colorize` accepts 6-digit hex from `GetColorHex`.

### Changed
- `borderSubtle` is now `gray950` (was `gray800`, identical to `surfacePanel`, so Inset borders and dividers were invisible on panels).
- `surfaceRowHover` is now a translucent white overlay (`whiteOverlay08`) so row hover reads on any surface and over the selection.
- `textMuted` is now `gray400` (was ~3:1 contrast on `surfacePanel`).
- Input shows a hover border; Tree/VirtualList rows use `rowHeight`, `fontSmall`, truncation and token-based indents.
- Hardcoded fonts/spacing in Section, SectionHeader, StatusRow, Tree, VirtualList, Grid, Tabs and MultiLineEditBox replaced with tokens.
- Registered themes default to the `ModernDark` border pack.

### Added
- `FenUI:GetPixelSize(frame, size)` and `FenUI:GetDB()`.

## [3.0.0] - 2026-01-03

### Changed
- **Standalone Library** - FenUI is now fully independent with no external dependencies.
  - Removed soft dependency on FenCore.
  - `Utils/Formatting.lua` now uses WoW's `issecretvalue` API directly.
  - All utility functions are self-contained within FenUI.
- **Removed Files** - Migrated utility modules to FenCore (separate library):
  - Removed `Utils/Tables.lua` (use FenCore.Tables if needed)
  - Removed `Utils/SecretValues.lua` (use FenCore.Secrets if needed)
  - Removed `Utils/Environment.lua` (use FenCore.Environment if needed)

### Notes
- FenUI and FenCore are now completely independent libraries.
- Addons can choose to use FenUI only, FenCore only, or both.
- No migration required - FenUI widgets work exactly as before.

## [2.8.0] - 2025-12-27

### Changed
- Added Animation & Transition System

## [2.8.0] - 2025-12-27

### Added
- **Animation & Transition System** - A declarative motion system wrapping WoW's native `AnimationGroup`.
  - **Property Transitions** - Automatically animate changes to `alpha`, `scale`, and `offset` (e.g., `panel:SetAlpha(0.5)`).
  - **Lifecycle Animations** - Built-in `showAnimation` and `hideAnimation` hooks for `Layout` and `Panel`.
  - **Animation Library** - Presets including `fadeIn`, `fadeOut`, `scaleIn`, `slideUp`, and `bounce`.
  - **Keyframes** - Support for multi-step animations via `Animation:Keyframes()`.
  - **Chaining & Callbacks** - Sequence animations with `.Then()` and use `onStart`/`onComplete`/`onCancel` hooks.
  - **Fluent API** - Added `transition()`, `showAnimation()`, and `hideAnimation()` to `PanelBuilder`.

## [2.7.0] - 2025-12-26

### Added
- **New `Stack` and `Flex` layout widgets** - Flexbox-inspired stacking system for declarative UI.
  - Supports `vertical` and `horizontal` directions.
  - Full alignment support (`start`, `center`, `end`, `stretch`).
  - Full justification support (`start`, `center`, `end`, `space-between`, `space-around`).
  - Dynamic `grow` and `shrink` child properties.
  - Wrapping support with `rowGap` for responsive flows.
  - Inherits from `Layout` for borders, backgrounds, and shadows.

## [2.6.0] - 2025-12-26

### Added
- **New `ImageButton` widget** - High-performance icon buttons built on the Image component logic.
  - Supports tactile states (hover, pressed/dimmed, disabled) with optional 1px texture shift.
  - Built-in toggle mode support (`isToggle = true`).
  - Inherits all Image features (masking, sizing modes, conditional textures).
- **Texture-based Checkboxes** - `CreateCheckbox` now supports custom icons via `checkedTexture` and `uncheckedTexture` config.
  - Added `boxSize` option for easier checkbox sizing.
- **Image Sharpness Improvements** - Icons now use `TRILINEAR` filtering and `SetSnapToPixelGrid(true)` for better clarity at non-power-of-two sizes.
- **Monospaced Font Support** - Added infrastructure for modern custom fonts.
  - Defaults to **JetBrains Mono** if the font file is present in `Assets/Fonts/`.
  - Added `fontMono` token mapped to `FenUIMonoFont`.
- **Tab Badge Enhancements** - `SetTabBadge()` now supports both text and icons (atlas or texture).
  - Supports semantic color tokens for badge tinting (e.g., green for OK, red for Error).

### Changed
- **Toolbar** - Added `AddImageButton()` helper method.
- **Image Mixin** - Exported `ImageMixin:InitImage()` for better extensibility.

## [2.5.0] - 2025-12-25

### Changed
- Added MultiLineEditBox, SectionHeader, and StatusRow widgets. Internal code cleanup and linting fixes.

## [2.4.0] - 2025-12-19

### Fixed

- **NineSlice background compatibility** - Background textures now render correctly with NineSlice borders
  - Created dedicated `bgFrame` child at frameLevel 0 (follows Blizzard's FlatPanelBackgroundTemplate pattern)
  - Removed BackdropTemplate inheritance from Layout frames (conflicts with NineSlice in WoW 9.1.5+)
- **Deferred sizing issue** - Backgrounds now display correctly for frames sized via anchor points
  - Added `OnSizeChanged` handler that reapplies background anchors when frame gets actual size
- **Asymmetric chamfer support** - Different border edges now get appropriate insets
  - Panel: left=6, right=2, top=6, bottom=2 (chamfered corners vs straight edges)
  - Inset: uniform 2px
  - Dialog: uniform 6px

### Infrastructure

- Updated `AGENTS.md` with new library management script path (`lib_sync.ps1`).

### Added

- **`BORDER_INSETS` table** - Per-border-type asymmetric inset definitions
- **Asymmetric inset support** - `SetBackgroundInset()` now accepts `{ left, right, top, bottom }` table
- **Troubleshooting guide** - Added to AGENTS.md for common background issues
- **Background architecture docs** - Added to SPACING.md explaining the bgFrame pattern

### Changed

- `ApplyBackgroundAnchors()` now supports both number (symmetric) and table (asymmetric) insets
- Enhanced code comments in Layout.lua explaining the NineSlice compatibility architecture

## [2.3.1] - 2025-12-19

### Fixed

- **Background bleeding at chamfered corners** - Layout now auto-insets backgrounds 3px from edges when borders are applied
- **Panel title positioning** - Title now vertically centered in header bar with smaller font
- **Panel close button positioning** - Close button now flush with top-right corner

### Added

- `SetBackgroundInset()` method on Layout for manual background inset control
- `backgroundInset` config option for Layout

## [2.3.0] - 2025-12-19

### Added

- **Drop shadow system** - Full implementation using custom textures:
  - `shadow = "soft"` - 64px soft shadow with offset
  - `shadow = "hard"` - 64px hard/sharp shadow
  - `shadow = "glow"` - 64px soft glow (additive blend)
  - `shadow = "glowHard"` - 24px hard glow
- **Custom shadow/glow assets** in `Assets/` folder:
  - `shadow-soft-64.png` - Soft shadow gradient
  - `shadow-hard-64.png` - Hard shadow gradient
  - `glow-soft-64.png` - Soft glow gradient
  - `glow-hard-24.png` - Hard glow gradient
- **Glow color customization** - `shadow = { type = "glow", color = "gold500" }`

### Changed

- Inner shadow textures now use `INNER_SHADOW_TEXTURES` constant (internal refactor)
- Drop shadows render on a frame behind the main layout (proper layering)

## [2.2.0] - 2025-12-19

### Added

- **Layout component** - Foundational container primitive that unifies:
  - Background system (color, image, gradient, conditional via Image component)
  - Border system (NineSlice via BlizzardBridge)
  - Inner shadow system (using Blizzard's `Interface\Common\ShadowOverlay-*` textures)
  - Multi-cell row system with CSS Grid-like syntax (`rows`, `cells`, `gap`)
- **`fill` mode for Image** - `fill = true` stretches image to parent bounds
- **`drawLayer` option for Image** - Control texture draw layer (default: "ARTWORK")
- **Convenience container aliases**:
  - `FenUI:CreateCard()` - Layout with subtle border
  - `FenUI:CreateDialog()` - Layout with shadow preset
- **New design tokens**:
  - Background: `backgroundDefault`, `backgroundElevated`, `backgroundInset`, `backgroundCard`, `backgroundDialog`
  - Shadow: `shadowColor`, `shadowAlphaInner`, `shadowAlphaDrop`
  - Layout: `shadowSizeInner`, `shadowSizeDrop`, `shadowOffsetX`, `shadowOffsetY`

### Changed

- **Panel** now uses Layout internally (supports background, shadow config)
- **Inset** now uses Layout internally when available (backwards compatible)
- **Load order** updated: Image → Layout → Panel/Containers → other widgets

## [2.1.0] - 2025-12-19

### Added

- **Image widget** - Full-featured image component with:
  - Conditional variants (faction, class, race, spec, custom resolver)
  - Sizing modes (fit, fill, contain, cover)
  - Fallback/placeholder handling
  - Tinting with FenUI tokens
  - Interactive handlers (onClick, onEnter, onLeave, tooltip)
  - Masking (circle, rounded, custom)
  - Atlas texture support
- **EmptyState slot architecture** - Two-slot system (top/bottom) for flexible content:
  - `image` config for conditional Image component
  - `SetSlot()` / `ClearSlot()` / `GetSlot()` methods
  - Backwards compatible with existing `icon`, `title`, `subtitle` props
- **Image semantic tokens** - `imageTintDefault`, `imageTintMuted`, `imagePlaceholder`
- **Custom condition resolver registration** - `FenUI:RegisterImageCondition()`

### Changed

- EmptyState now uses Image component internally for icons/images

## [2.0.0] - 2025-12-19

### Added

- **Blizzard-first architecture** - Complete rebuild using native WoW UI APIs
- **Three-tier design token system** - Primitive, semantic, and component tokens
- **Panel widget** - Window container with title, close button, and content slots
- **Tabs widget** - Tab groups with badges, disabled states, and focus handling
- **Grid widget** - CSS Grid-inspired layout with column definitions and data binding
- **Toolbar widget** - Horizontal slot-based layout for buttons and controls
- **EmptyState widget** - Centered overlay for empty content areas
- **Buttons** - Standard, icon, and close button variants
- **Containers** - Insets and scroll panels
- **Theme system** - Multiple built-in themes with easy switching
- **BlizzardBridge** - NineSlice layout helpers and Atlas utilities
- **Validation suite** - Detect Blizzard API changes with `/fenui validate`
- **Graceful degradation** - Addons work without FenUI installed
- **Dual API** - Config object and fluent builder patterns
- **Lifecycle hooks** - onCreate, onShow, onHide, onThemeChange

### Changed

- Rebuilt from scratch as a Blizzard-first library (previously Plumber-derived)
- Now distributed as an embedded library via `update_libs.ps1`

### Removed

- Plumber-style ornate borders (now uses native Blizzard themes)
- Custom texture assets (now uses Blizzard Atlas system)

## [1.x] - Legacy

Previous versions were based on Plumber and distributed as part of the Weekly addon.
FenUI 2.0 is a complete rewrite with a new architecture.
