import 'package:flutter/material.dart';

/// Status, cash-band and performance colours (docs/UI_DESIGN.md §1). Status is always shown with an
/// icon and a text label too, never by colour alone.
abstract final class StatusColors {
  static const active = Color(0xFF16A34A);
  static const offline = Color(0xFFDC2626);
  static const closed = Color(0xFFF97316);
  static const supervisor = Color(0xFF7C3AED);
  static const idle = Color(0xFF64748B);
  static const unknown = Color(0xFF94A3B8);

  static const activeIcon = Icons.wifi_rounded;
  static const offlineIcon = Icons.wifi_off_rounded;
  static const closedIcon = Icons.do_not_disturb_on_rounded;
  static const supervisorIcon = Icons.admin_panel_settings_rounded;
  static const idleIcon = Icons.hourglass_empty_rounded;
  static const unknownIcon = Icons.help_rounded;
}

/// Legacy cash-level colours, kept.
abstract final class CashColors {
  static const zero = Color(0xFFFF6F3E);
  static const low = Color(0xFF0085B2);
  static const moderate = Color(0xFF005680);
  static const high = Color(0xFF008040);
  static const jam = Color(0xFFFF8F6A);
}

abstract final class PerformanceColors {
  static const uptime = Color(0xFF16A34A);
  static const inProgress = Color(0xFFF59E0B);
  static const downtime = Color(0xFFDC2626);
}
