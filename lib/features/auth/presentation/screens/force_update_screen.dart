import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

/// Blocking screen for `426 UPGRADE_REQUIRED` or a `min_app_version` above this build.
class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  static const _androidId = 'com.elite.eliteprovidus';

  Future<void> _openStore() async {
    // iOS App Store id is not known yet (docs/IOS_HANDOFF.md §6).
    if (!Platform.isAndroid) return;
    final market = Uri.parse('market://details?id=$_androidId');
    if (!await launchUrl(market)) {
      await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=$_androidId'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.screenPadding),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(color: p.lavenderSoft, shape: BoxShape.circle),
                child: Icon(Icons.system_update_rounded, size: 52, color: p.ink),
              ),
              const SizedBox(height: 28),
              Text('Update required', style: text.headlineLarge, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Text(
                'This version of Elite Mobile is no longer supported. Please install the latest version to continue.',
                style: text.bodyLarge?.copyWith(color: p.inkMuted),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(onPressed: _openStore, child: const Text('Update Elite Mobile')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
