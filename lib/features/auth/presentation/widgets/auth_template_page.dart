import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/ui/widgets/app_decorative_background.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

class AuthTemplatePage extends StatelessWidget {
  const AuthTemplatePage({
    required this.title,
    required this.subtitle,
    required this.child,
    super.key,
    this.logoWidth = 150,
    this.logoHeight = 150,
    this.maxWidth = 480,
    this.contentSpacing = 32,
    this.showAppBarActions = true,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final double logoWidth;
  final double logoHeight;
  final double maxWidth;
  final double contentSpacing;
  final bool showAppBarActions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final strings = context.t.auth.login;
    final languageCode = LocaleSettings.currentLocale.languageCode.toUpperCase();
    final contentTopPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + 8;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: context.router.canPop(),
        actions: showAppBarActions
            ? [
                _AuthAppBarAction(
                  tooltip: strings.switch_language,
                  onPressed: () => _switchLanguage(context),
                  child: Text(
                    languageCode,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _AuthAppBarAction(
                  tooltip: strings.switch_theme,
                  onPressed: () => _switchTheme(context),
                  child: Icon(
                    theme.brightness == Brightness.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: 21,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(width: 16),
              ]
            : null,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AppDecorativeBackground(
            topOpacity: .05,
            bottomOpacity: .035,
          ),
          SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
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
                        width: logoWidth,
                        height: logoHeight,
                        colorFilter: ColorFilter.mode(
                          colors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: contentSpacing),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _switchLanguage(BuildContext context) async {
    final nextLocale = LocaleSettings.currentLocale == AppLocale.en
        ? AppLocale.ar
        : AppLocale.en;

    await LocaleSettings.setLocale(nextLocale);

    if (!context.mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(
      nextLocale.languageCode,
    );
  }

  void _switchTheme(BuildContext context) {
    final nextMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    context.read<ApplicationStartCubit>().updateThemeMode(nextMode);
  }
}

class _AuthAppBarAction extends StatelessWidget {
  const _AuthAppBarAction({
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
          child: SizedBox.square(
            dimension: 42,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
