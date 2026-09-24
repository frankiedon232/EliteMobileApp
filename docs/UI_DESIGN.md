# UI Design System

> **Direction change, 2026-09-24 (Frankie):** the look moves from the navy/gold banking style to a soft,
> rounded, pastel style (lavender + mint) based on a reference design Frankie supplied. Features, screens and
> navigation are unchanged. Providus navy/gold now appear only in the logo, app icon and splash.

Goal: calm, friendly and airy, but still data-dense. Soft lilac-grey canvas, big white rounded cards,
pastel tiles, black pill buttons, round icon buttons, lavender accent, and a disciplined status palette.
Material 3 base, heavily themed.

## 1. Colour tokens (`core/theme/app_colors.dart`)

### Surfaces and text
| Token | Light | Dark | Use |
|---|---|---|---|
| `canvas` | `#F3F2FB` | `#0E0F15` | scaffold background |
| `surface` | `#FFFFFF` | `#191A23` | cards, bottom bar, sheets |
| `surfaceMuted` | `#F7F6FD` | `#21222D` | inputs, inner blocks inside cards |
| `ink` | `#15161C` | `#F2F2F7` | primary text |
| `inkMuted` | `#6F7182` | `#9A9CAD` | secondary text, captions |
| `outline` | `#ECEAF6` | `#2A2B37` | hairlines, dashed dividers |
| `inverse` | `#111318` | `#FFFFFF` | primary pill button background |
| `onInverse` | `#FFFFFF` | `#111318` | primary pill button text/icon |

### Accent and pastels
| Token | Light | Dark | Use |
|---|---|---|---|
| `lavender` | `#8B7CF6` | `#A79BFF` | accent: links ("View all"), active nav item, highlighted numbers, switches, focus |
| `lavenderSoft` | `#E4E0FF` | `#2E2A4D` | selected chips, soft badges, tile background |
| `mint` | `#CFF1EA` | `#1D3A35` | tile background |
| `peach` | `#FFE3D6` | `#43302A` | tile background |
| `sky` | `#DDEBFF` | `#1E2C44` | tile background |
| `butter` | `#FFF1CC` | `#3D3522` | tile background |

Brand (logo/splash/icon only): navy `#011F53`, gold `#FCB815`, red `#E5353F`.

### Status (`status_colors.dart`), always with an icon and a text label
| Status | Colour | Soft background (12 %) | Icon (Material rounded) |
|---|---|---|---|
| Active / In service / Online | `#16A34A` | tint | `wifi` |
| Offline / No service | `#DC2626` | tint | `wifi_off` |
| Closed | `#F97316` | tint | `do_not_disturb_on` |
| Supervisor | `#7C3AED` | tint | `admin_panel_settings` |
| Idle | `#64748B` | tint | `hourglass_empty` |
| Unknown | `#94A3B8` | tint | `help` |

### Cash level (legacy colours, kept for bars and dots)
Zero `#FF6F3E` · Low `#0085B2` · Moderate `#005680` · High `#008040` · Cash jam `#FF8F6A`.

### Performance
Uptime `#16A34A`, In progress `#F59E0B`, Downtime `#DC2626`.

## 2. Typography

`google_fonts`: **Urbanist** (UI; geometric, like the reference) + **JetBrains Mono** (terminal ids, amounts
in tables). Scale: display 40/600 (hero numbers), headline 28/600 (screen titles, two lines allowed, light
and airy), title 18/600, body 15/500, label 13/600, caption 12/500. Tabular figures for all numbers.

## 3. Shape, spacing, elevation

- 4-pt grid; screen padding 20; card padding 18; gap between cards 14.
- Radius: cards 28, inner blocks/tiles 20, inputs 20, chips/pills/buttons 999, sheets 32 (top),
  round icon buttons 48 × 48 circles.
- Elevation: no borders on cards; one very soft shadow in light (`0 8 24 rgba(40,32,90,0.06)`), none in dark.
- Dashed hairline dividers inside "ticket" cards, with half-circle notches on both edges.
- Motion: 200–300 ms, `Curves.easeOutCubic`; count-up numbers; staggered card entrance
  (`flutter_animate`, 40 ms stagger); respect "reduce motion".

## 4. App shell

- **Floating bottom bar**: white capsule (radius 28) inset 16 from the edges and bottom, icons only
  (Overview · Terminals · Performance · More), active icon in `lavender` with a small pill indicator below.
  Every item has a semantic label and tooltip.
- **Top bar pattern**: round white icon buttons (back on the left; search / share / more / bell on the right),
  large two-line title below, then a muted subtitle ("312 terminals in South West").
- Status bar: dark icons on the light canvas; light icons in dark mode.

## 5. Shared components (`core/widgets/`)

| Widget | Description |
|---|---|
| `EliteCard` | white card, radius 28, soft shadow, optional onTap ripple |
| `RoundIconButton` | 48 px white circle with an icon; optional red badge dot (bell) |
| `PillChip` | e.g. region chip with a leading icon in a coloured circle (like the "320 points" chip) |
| `CategoryTile` | pastel tile (mint/lilac/peach/sky), label top-left, big icon/illustration bottom-right, optional badge |
| `StatCard` | icon in tinted circle, big value, label, sub-label, optional mini progress bar |
| `StatusPill` | coloured icon + label on a 12 % tint, pill shape |
| `CashLevelBar` | labelled horizontal bar with % and count, band colour, rounded ends |
| `RadialGauge` | fl_chart ring with centred % |
| `DonutChart` | status distribution with legend |
| `AtmCard` | "ticket" card for a terminal (§6.4) |
| `SectionHeader` | title left + lavender "View all" right |
| `SegmentedPill` | black selected pill + plain option (like "One Way / Round Trip") |
| `RegionSelector` | `PillChip` opening a searchable bottom sheet |
| `FilterChipBar` | horizontally scrollable pill chips with counts; selected = black pill |
| `FilterSheet` | bottom sheet with facets, "Reset" + black "Apply (n)" |
| `SearchField` | filled `surfaceMuted`, radius 20, leading icon in a white circle, clear button, debounced |
| `FieldTile` | form row: icon in a circle, small muted label over the value (like From / To / Date) |
| `PaginationBar` | "21–40 of 312", page size menu, prev/next round buttons, page numbers |
| `EliteDataTable` | `data_table_2` wrapper: sticky header, soft zebra rows, status-coloured cells |
| `SkeletonBox`/`SkeletonList` | shimmer placeholders matching real layouts |
| `EmptyState` / `ErrorState` | pastel circle illustration, title, message, black pill action |
| `OfflineBanner` | slim peach banner "Offline · showing data from 10:42" |
| `LastUpdated` | "Updated 2 min ago" with refresh icon |
| `EliteButton` | primary = black pill (`inverse`), secondary = white pill with outline, text = lavender |

## 6. Screens

### 6.1 Splash & Onboarding
Native splash stays navy with the "elite" wordmark (brand moment). Onboarding: canvas background with a
large pastel illustration card per slide (monitor, shield-lock, encrypted) on mint / lilac / sky, big
two-line title, muted body, lavender pill page indicator, black "Continue" pill, "Skip" text button.

### 6.2 Login
Top: pastel illustration area (mint → lilac gradient with a large ATM/shield illustration) and the navy
"elite" wordmark. Below, a white card (radius 28) overlapping the illustration: "Welcome back" (large),
"Sign in with your Providus AD credentials", `FieldTile`-style username and password inputs, remember-username
switch (lavender), black full-width "Sign in" pill, footer "© <year> Unet System Tech · v1.0.0".

### 6.3 Overview (like the reference home screen)
1. Top row: region `PillChip` (e.g. "South West ▾") left; search and bell `RoundIconButton`s right.
2. Greeting + big two-line title: "Good morning, John" / "Your ATM estate at a glance".
3. Category tiles row (horizontal, pastel): **Online** (mint), **Offline** (peach, red badge with count),
   **Cash** (sky), **Performance** (lilac): each opens the matching list/screen.
4. Hero card: total terminals (count-up) with Uptime / In progress / Downtime mini stats.
5. "Real-time status" section: donut card + 2×2 `StatCard`s.
6. "Cash levels" section: card with a stacked bar + 5 `CashLevelBar`s.
7. "ATMs of interest" section with "View all": horizontal list of compact `AtmCard`s.
8. `LastUpdated` footer.

### 6.4 Terminals list (like the reference search results)
Top bar: back/filters round buttons, title "Offline ATMs", subtitle "There are **312** terminals in
South West" (count in lavender). Search pill, `FilterChipBar`, active-filter chips, list, "Filters (2)" black
pill floating bottom-right.

**AtmCard (ticket)**:
```
╭──────────────────────────────────────────╮
│ (◉) BRANCH ATM                  (☆) (⋯)   │  ← status icon circle, location type caption, round buttons
│     Ikeja Allen                            │
│ 10441234  ─ ─ ─ ─ 2h ago ─ ─ ─ ─ ● OFFLINE │  ← mono id, dashed line with last-txn, StatusPill
│ NCR-S2 · Lagos                South West   │
│ ◖ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ◗ │  ← notched dashed divider
│ ▓▓▓▓▓░░░ Moderate          [ ₦2,450,000 ] │  ← CashLevelBar mini + black amount pill
╰──────────────────────────────────────────╯
```
Jam / card-reader warnings show as small lavender or red pills ("Cash jam", "Card reader fault").

**Table view**: all columns, sticky Terminal column, status cell as pill, amounts right-aligned mono.

### 6.5 Terminal detail (like the reference boarding pass)
Round back / share / more buttons. Ticket card: status circle + location header, big mono terminal id,
dashed notched divider, a grid of pastel info blocks (Status, Cash, Brand, State, Region, Last txn), then
"Performance today" with a large uptime gauge and 4 small metrics. Black pill actions row
(Performance report, Open in Maps) + round watchlist/copy buttons.

### 6.6 Performance
`SegmentedPill`: Realtime | Report. Realtime: summary card (average uptime, number below 90 %), then list
cards with a split uptime/downtime bar. Report: form card with `FieldTile`s (Terminal, From, To) and date
presets as pills, black "Run report" pill; results card with chart + table, export buttons.

### 6.7 More
Profile card (avatar circle, name, role, scope chip), then grouped white cards of list tiles with icons in
pastel circles: Terminal lookup, Backed-out terminals, Watchlist, Notifications, Settings, About, Logout (red).

### 6.8 Notifications inbox
Grouped by Today / Yesterday / Earlier; each item a white card with a category icon in a status-tinted
circle, unread lavender dot, swipe to delete, "Mark all read".

## 7. States

- Loading: skeletons shaped like the real content (never full-screen spinners except login submit).
- Empty: pastel circle icon + friendly copy ("No offline ATMs right now 🎉").
- Error: icon, human message, black "Retry" pill; keep cached data visible with an inline error chip.

## 8. Dark mode
Fully supported: canvas `#0E0F15`, cards `#191A23`, pastels become deep tints (table in §1), primary pill
turns white with dark text. Verify every chart and pill for contrast.
