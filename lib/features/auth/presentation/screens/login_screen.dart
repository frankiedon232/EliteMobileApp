import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/config_providers.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/app_prefs.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/elite_card.dart';
import '../../../../core/widgets/elite_wordmark.dart';
import '../session_controller.dart';
import '../widgets/pastel_illustration.dart';

/// AD sign-in (FEATURES §1.2–1.3, docs/UI_DESIGN.md §6.2).
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _passwordFocus = FocusNode();
  var _remember = true;
  var _obscure = true;
  var _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final prefs = ref.read(appPrefsProvider);
    _remember = prefs.rememberUsername;
    _username.text = prefs.rememberedUsername ?? '';
    final session = ref.read(sessionProvider);
    if (session is SignedOut) _error = session.message;
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_busy) return;
    setState(() => _error = null);
    if (!(_form.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    setState(() => _busy = true);
    final username = _username.text.trim();
    try {
      await ref.read(sessionProvider.notifier).login(username: username, password: _password.text);
      await ref.read(appPrefsProvider).setRememberedUsername(remember: _remember, username: username);
      TextInput.finishAutofillContext();
      // The router redirects to /home once the session is signed in.
    } on Failure catch (f) {
      _password.clear();
      if (mounted) setState(() => _error = _messageFor(f));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  static String _messageFor(Failure f) => switch (f) {
    RateLimited(:final retryAfter?) when retryAfter.inSeconds > 0 =>
      'Too many attempts. Try again in ${(retryAfter.inSeconds / 60).ceil()} min.',
    _ => f.message,
  };

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    final text = Theme.of(context).textTheme;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final version = ref.watch(appConfigProvider).appVersion;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          // Pastel header with illustration (mint → lilac).
          Container(
            height: height * 0.42,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [p.mint, p.lavenderSoft],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  Positioned(
                    left: AppTheme.screenPadding,
                    top: 16,
                    child: EliteWordmark(height: 30, color: dark ? Colors.white : AppColors.navy900),
                  ),
                  Positioned(
                    right: -10,
                    bottom: height * 0.06,
                    child: PastelIllustration(
                      icon: Icons.atm_rounded,
                      chips: const [Icons.shield_rounded, Icons.wifi_rounded],
                      color: p.mint,
                      size: (height * 0.26).clamp(150, 230),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(16, height * 0.30, 16, 24),
              child: Column(
                children: [
                  EliteCard(
                    padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
                    child: AutofillGroup(
                      child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Welcome back', style: text.headlineLarge),
                            const SizedBox(height: 6),
                            Text(
                              'Sign in with your Providus AD credentials',
                              style: text.bodyMedium?.copyWith(color: p.inkMuted),
                            ),
                            const SizedBox(height: 22),
                            TextFormField(
                              controller: _username,
                              enabled: !_busy,
                              autofillHints: const [AutofillHints.username],
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              enableSuggestions: false,
                              maxLength: 100,
                              decoration: _decoration(context, 'Username', Icons.person_outline_rounded),
                              validator: (v) =>
                                  (v == null || v.trim().isEmpty) ? 'Enter your username' : null,
                              onFieldSubmitted: (_) => _passwordFocus.requestFocus(),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _password,
                              focusNode: _passwordFocus,
                              enabled: !_busy,
                              obscureText: _obscure,
                              autofillHints: const [AutofillHints.password],
                              textInputAction: TextInputAction.done,
                              autocorrect: false,
                              enableSuggestions: false,
                              maxLength: 256,
                              decoration: _decoration(context, 'Password', Icons.lock_outline_rounded)
                                  .copyWith(
                                    suffixIcon: IconButton(
                                      tooltip: _obscure ? 'Show password' : 'Hide password',
                                      icon: Icon(
                                        _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      ),
                                      onPressed: () => setState(() => _obscure = !_obscure),
                                    ),
                                  ),
                              validator: (v) => (v == null || v.isEmpty) ? 'Enter your password' : null,
                              onFieldSubmitted: (_) => _submit(),
                            ),
                            const SizedBox(height: 6),
                            SwitchListTile.adaptive(
                              contentPadding: const EdgeInsets.only(left: 4),
                              value: _remember,
                              onChanged: _busy ? null : (v) => setState(() => _remember = v),
                              title: Text('Remember username', style: text.bodyMedium),
                            ),
                            AnimatedSize(
                              duration: AppTheme.motion,
                              curve: AppTheme.motionCurve,
                              child: _error == null
                                  ? const SizedBox(width: double.infinity)
                                  : _ErrorBanner(_error!),
                            ),
                            const SizedBox(height: 14),
                            FilledButton(
                              onPressed: _busy ? null : _submit,
                              child: _busy
                                  ? SizedBox.square(
                                      dimension: 22,
                                      child: CircularProgressIndicator(strokeWidth: 2.4, color: p.onInverse),
                                    )
                                  : const Text('Sign in'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '© ${DateTime.now().year} Unet System Tech · v$version',
                    style: text.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static InputDecoration _decoration(BuildContext context, String label, IconData icon) {
    final p = AppPalette.of(context);
    return InputDecoration(
      labelText: label,
      counterText: '',
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 10, right: 8),
        child: CircleAvatar(
          radius: 17,
          backgroundColor: p.surface,
          child: Icon(icon, size: 19, color: p.ink),
        ),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 54, minHeight: 40),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    final p = AppPalette.of(context);
    return Semantics(
      liveRegion: true,
      child: Container(
        margin: const EdgeInsets.only(top: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: p.danger.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppTheme.blockRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline_rounded, color: p.danger, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: p.danger)),
            ),
          ],
        ),
      ),
    );
  }
}
