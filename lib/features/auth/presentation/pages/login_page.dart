import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/features/auth/application/cubit/auth_cubit.dart';
import 'package:scouting_hub/features/auth/application/cubit/auth_state.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(text: 'demo@example.com');
  final _passwordController = TextEditingController(text: 'password');

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.login;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final languageCode = LocaleSettings.currentLocale.languageCode
        .toUpperCase();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: context.router.canPop(),
        actions: [
          TextButton.icon(
            onPressed: _switchLanguage,
            icon: const Icon(Icons.language_rounded, size: 20),
            label: Text(languageCode),
          ),
          IconButton(
            tooltip: strings.switch_theme,
            onPressed: _switchTheme,
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state case AuthError(:final message)) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(message)));
          }

          if (state is AuthAuthenticated) {
            await context.router.replaceAll([const HomeRoute()]);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: AutofillGroup(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                    shrinkWrap: true,
                    children: [
                      Align(
                        child: SvgPicture.asset(
                          'assets/branding/muslim_scout_logo.svg',
                          width: 150,
                          height: 150,
                          colorFilter: ColorFilter.mode(
                            colors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        strings.title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        strings.subtitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 32),
                      AuthTextField(
                        controller: _emailController,
                        label: strings.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.email_outlined),
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 14),
                      AuthTextField(
                        controller: _passwordController,
                        label: strings.password,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.done,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          tooltip: _obscurePassword
                              ? strings.show_password
                              : strings.hide_password,
                          onPressed: isLoading
                              ? null
                              : () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        enabled: !isLoading,
                        onSubmitted: (_) => _submit(),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: isLoading
                              ? null
                              : () => context.router.push(
                                  const ForgotPasswordRoute(),
                                ),
                          child: Text(strings.forgot_password),
                        ),
                      ),
                      const SizedBox(height: 4),
                      FilledButton(
                        onPressed: isLoading ? null : _submit,
                        child: isLoading
                            ? const SizedBox.square(
                                dimension: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(strings.submit),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(strings.no_account),
                          TextButton(
                            onPressed: isLoading
                                ? null
                                : () => context.router.push(
                                    const RegisterRoute(),
                                  ),
                            child: Text(strings.register),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      /*Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              strings.or,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _showComingSoon,
                              icon: const _GoogleIcon(),
                              label: Text(strings.google),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _showComingSoon,
                              icon: const Icon(Icons.apple_rounded),
                              label: Text(strings.apple),
                            ),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _switchLanguage() async {
    final nextLocale = LocaleSettings.currentLocale == AppLocale.en
        ? AppLocale.ar
        : AppLocale.en;

    await LocaleSettings.setLocale(nextLocale);

    if (!mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(
      nextLocale.languageCode,
    );
  }

  void _switchTheme() {
    final currentBrightness = Theme.of(context).brightness;
    final nextMode = currentBrightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    context.read<ApplicationStartCubit>().updateThemeMode(nextMode);
  }

  /*void _showComingSoon() {
    final messenger = ScaffoldMessenger.of(context)


      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(context.t.auth.login.coming_soon)),
      );
  }*/

  Future<void> _submit() {
    return context.read<AuthCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return Text(
      'G',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
