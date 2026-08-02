import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/ui/widgets/app_decorative_background.dart';
import 'package:scouting_hub/features/auth/application/login/login_cubit.dart';
import 'package:scouting_hub/features/auth/presentation/extensions/auth_error_key_x.dart';
import 'package:scouting_hub/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<LoginCubit>(), child: this);
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
    final languageCode = LocaleSettings.currentLocale.languageCode.toUpperCase();
    final contentTopPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + 8;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: context.router.canPop(),
        actions: [
          _AppBarSquareAction(
            tooltip: strings.switch_language,
            onPressed: _switchLanguage,
            child: Text(
              languageCode,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _AppBarSquareAction(
            tooltip: strings.switch_theme,
            onPressed: _switchTheme,
            child: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              size: 21,
              color: colors.primary,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AppDecorativeBackground(
            topOpacity: .05,
            bottomOpacity: .035,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                previous.error != current.error ||
                previous.session != current.session,
            listener: (context, state) async {
              final error = state.error;
              if (error != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(error.translate(context))));
              }

              if (state.session != null) {
                await context.router.replaceAll([const HomeRoute()]);
              }
            },
            builder: (context, state) {
              return SafeArea(
                top: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: AutofillGroup(
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          24,
                          contentTopPadding,
                          24,
                          32,
                        ),
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
                          const SizedBox(height: 10),
                          Text(
                            strings.subtitle,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 32),
                          AuthTextField(
                            controller: _emailController,
                            label: strings.email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: const Icon(Icons.email_outlined),
                            enabled: !state.isLoading,
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
                              onPressed: state.isLoading
                                  ? null
                                  : () => setState(
                                      () => _obscurePassword = !_obscurePassword,
                                    ),
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                            enabled: !state.isLoading,
                            onSubmitted: (_) => _submit(),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () => context.router.push(
                                      const ForgotPasswordRoute(),
                                    ),
                              child: Text(strings.forgot_password),
                            ),
                          ),
                          const SizedBox(height: 4),
                          FilledButton(
                            onPressed: state.isLoading ? null : _submit,
                            child: state.isLoading
                                ? const SizedBox.square(
                                    dimension: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
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
                                onPressed: state.isLoading
                                    ? null
                                    : () => context.router.push(
                                        const RegisterRoute(),
                                      ),
                                child: Text(strings.register),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _switchLanguage() async {
    final nextLocale = LocaleSettings.currentLocale == AppLocale.en
        ? AppLocale.ar
        : AppLocale.en;
    await LocaleSettings.setLocale(nextLocale);
    if (!mounted) return;
    context.read<ApplicationStartCubit>().updateLocale(nextLocale.languageCode);
  }

  void _switchTheme() {
    final nextMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    context.read<ApplicationStartCubit>().updateThemeMode(nextMode);
  }

  Future<void> _submit() {
    return context.read<LoginCubit>().submit(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}

class _AppBarSquareAction extends StatelessWidget {
  const _AppBarSquareAction({
    required this.tooltip,
    required this.onPressed,
    required this.child,
  });

  final String tooltip;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Tooltip(
      message: tooltip,
      child: Material(
        color: colors.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: colors.primary.withValues(alpha: .55),
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(dimension: 42, child: Center(child: child)),
        ),
      ),
    );
  }
}
