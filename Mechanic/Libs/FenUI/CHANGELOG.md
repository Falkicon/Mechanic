# Changelog

All notable changes to FenUI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).



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
