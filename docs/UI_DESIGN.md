# UI Design System

Goal: a premium, calm, data-dense banking dashboard. Clean white/near-black surfaces, the Providus navy
and gold as brand anchors, and a disciplined status palette. Material 3 base, heavily themed.

## 1. Colour tokens (`core/theme/app_colors.dart`)

### Brand
| Token | Light | Dark | Use |
|---|---|---|---|
| `navy900` | `#011F53` | same | app bar in hero areas, splash, status bar, primary buttons (dark text on gold alt) |
| `navy700` | `#0A3275` | — | gradients |
| `gold500` | `#FCB815` | `#FFC83D` | accent, primary CTA, active chip, FAB, highlights |
| `red500` | `#E5353F` | `#FF5A63` | "Providus" wordmark accent, destructive |
| `ink` | `#1B1E2E` | `#EDEFF7` | primary text |
| `inkMuted` | `#5B6178` | `#9AA0B8` | secondary text |
| `surface` | `#FFFFFF` | `#141826` | cards |
| `background` | `#F5F7FF` | `#0B0E18` | scaffold |
| `outline` | `#E4E7F2` | `#262B3D` | borders, dividers |

Hero gradient: `navy900 → navy700` (top-left → bottom-right) with a subtle city-skyline image
(`city2.png`) at 8–12 % opacity.

### Status (`status_colors.dart`) — always paired with an icon + text label
| Status | Colour | Icon (Material Symbols rounded) |
|---|---|---|
| Active / In service / Online | `#16A34A` | `wifi` |
| Offline / No service | `#DC2626` | `wifi_off` |
| Closed | `#F97316` | `do_not_disturb_on` |
| Supervisor | `#7C3AED` | `admin_panel_settings` / `sync_problem` |
| Idle | `#64748B` | `hourglass_empty` |
| Unknown | `#94A3B8` | `help` |

### Cash level (legacy colours, kept)
| Band | Colour |
|---|---|
| Zero cash | `#FF6F3E` |
| Low cash | `#0085B2` |
| Moderate cash | `#005680` |
| High cash | `#008040` |
| Cash jam | `#FF8F6A` |

### Performance
Uptime `#16A34A`, In-progress `#F59E0B`, Downtime `#DC2626`.

## 2. Typography

`google_fonts`: **Plus Jakarta Sans** (UI) + **JetBrains Mono** (terminal ids, amounts in tables).
Scale: display 40/700 (hero count), headline 24/700, title 18/600, body 15/400, label 13/600,
caption 12/500. Use tabular figures for all numbers (`FontFeature.tabularFigures()`).

## 3. Shape, spacing, elevation

- 4-pt grid; screen padding 16; card padding 16; gap between cards 12.
- Radius: cards 20, chips/pills 999, inputs 14, bottom sheets 28 (top).
- Elevation: flat cards with 1 px `outline` border + very soft shadow (`0 4 16 rgba(1,31,83,0.06)`)
  in light; border only in dark.
- Motion: 200–300 ms, `Curves.easeOutCubic`; count-up numbers; staggered card entrance
  (`flutter_animate`, 40 ms stagger); respect "reduce motion".

## 4. App shell

- **Bottom navigation** (NavigationBar, 4 items): Overview · Terminals · Performance · More.
  Replaces the legacy drawer (the drawer is kept only as an optional swipe-in on tablets — not needed
  on phones).
- Large collapsing header on Overview (SliverAppBar) with the navy gradient; other screens use a
  clean white app bar with title + actions.
- Status bar: light icons on navy areas, dark icons on white areas (use `AnnotatedRegion`).

## 5. Shared components (`core/widgets/`)

| Widget | Description |
|---|---|
| `EliteCard` | base card (radius 20, border, optional onTap with ink ripple) |
| `StatCard` | icon in tinted circle, big value, label, sub-label, optional mini progress bar, trend arrow |
| `StatusPill` | coloured dot/icon + label, tinted background (12 % opacity) |
| `CashLevelBar` | labelled horizontal bar with % and count, band colour |
| `RadialGauge` | fl_chart-based ring with centred % |
| `DonutChart` | status distribution with legend |
| `AtmCard` | rich terminal card (see §6.3) |
| `SectionHeader` | title + optional "View all" / region tag |
| `RegionSelector` | pill button opening a searchable bottom sheet |
| `FilterChipBar` | horizontally scrollable chips with counts |
| `FilterSheet` | modal bottom sheet with facets, "Reset" + "Apply (n)" |
| `SearchField` | rounded, leading icon, clear button, debounced |
| `PaginationBar` | "21–40 of 312", page size menu, prev/next, page numbers |
| `EliteDataTable` | `data_table_2` wrapper: sticky header, zebra rows, status-coloured cells |
| `SkeletonBox`/`SkeletonList` | shimmer placeholders matching real layouts |
| `EmptyState` / `ErrorState` | icon/illustration, title, message, action button |
| `OfflineBanner` | slim amber banner "Offline · showing data from 10:42" |
| `LastUpdated` | "Updated 2 min ago" with refresh icon |
| `EliteButton` | primary (gold bg, navy text), secondary (navy outline), text |

## 6. Screens

### 6.1 Splash & Onboarding
Native splash: navy background, centred Elite logo. Onboarding: full-bleed navy gradient + skyline,
logo top, illustration/icon per slide (monitor, shield-lock, encrypted), title in white, body in
white 80 %, dot indicator (active dot = gold pill), gold "Continue" button, "Skip" text button.

### 6.2 Login
Top 40 %: navy gradient + skyline + logo. Bottom sheet-style white card (radius 28 top) with
"WELCOME!" in gold, subtitle "Sign in with your AD credentials", username + password fields (filled,
rounded), remember-username switch, gold Sign In button full width, footer "© <year> · tando logo ·
All Rights Reserved" and app version.

### 6.3 Overview
1. Collapsing navy header: greeting, name, role, avatar, bell; Region selector pill; hero total count
   (display, count-up) "Terminals in <region>"; three mini-stats (Uptime/In-progress/Downtime) in
   frosted chips.
2. Quick actions row (4 round icon buttons).
3. "Real-time status": donut chart card (left) + 2×2 StatCards (In service, Offline, Closed,
   Supervisor) each with %, count, progress bar.
4. "Cash levels": card with stacked segmented bar on top and 5 CashLevelBars below.
5. "Performance": three RadialGauges in one card.
6. "ATMs of interest": 5 AtmCards compact + View all.
7. LastUpdated footer.

### 6.4 Terminals list
App bar: title = current filter ("Offline ATMs"), subtitle "Lagos · 312 terminals"; actions: view
toggle (cards/table), sort, export. Below: SearchField, FilterChipBar (with counts), active-filter
chips row, then list. FAB-style "Filters (2)" button bottom-right opening FilterSheet.

**AtmCard layout**:
```
┌───────────────────────────────────────────┐
│ [status icon]  10441234        ● OFFLINE   │  ← mono id, StatusPill
│ Ikeja Allen Branch                   ☆     │
│ ₦2,450,000.00   ▓▓▓▓▓░░░░ Moderate          │  ← CashLevelBar mini
│ NCR · Cash dispenser   Lagos · South West  │  ← chips/caption
│ ⏱ Last txn 2h ago    💳 OK    ⚠ Jam: No    │
└───────────────────────────────────────────┘
```

**Table view**: all columns, sticky Terminal column, status cell as pill, amounts right-aligned mono.

### 6.5 Terminal detail
Hero card with status colour accent strip on the left, id, location, status pill, meta grid
(brand, state, region, last txn). Performance card: large uptime gauge + 4 small metrics in a grid.
Actions row (watchlist, copy, share, report, map).

### 6.6 Performance
Tabs: Realtime | Report. Realtime: summary card (avg uptime, # below 90 %), then list cards with
split uptime/downtime bar. Report: form card (terminal field, date range picker with presets), results
card with chart + table, export buttons.

### 6.7 More
Profile card (name, email, phone, role, scope), then grouped list tiles: Terminal lookup, Backed-out
terminals, Watchlist, Notifications, Settings, About, Logout (red).

### 6.8 Notifications inbox
Grouped by Today / Yesterday / Earlier, category icon with status colour, unread dot, swipe to delete,
"Mark all read".

## 7. States

- Loading: skeletons shaped like the real content (never full-screen spinners except login submit).
- Empty: friendly icon + "No offline ATMs right now 🎉" style positive copy where it applies.
- Error: icon, human message, Retry; keep cached data visible with an inline error chip if available.

## 8. Dark mode
Fully supported; verify every chart and pill has adequate contrast. Navy header remains navy in dark
mode but cards use `surface` dark.
