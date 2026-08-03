import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';
import 'package:scouting_hub/core/theme/tokens/tokens.dart';
import 'package:scouting_hub/core/ui/widgets/app_decorative_background.dart';
import 'package:scouting_hub/core/ui/widgets/widgets.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.t.auth.welcome;
    final colors = Theme.of(context).colorScheme;
    final state = context.watch<ApplicationStartCubit>().state;
    final localeValue = switch (LocaleSettings.currentLocale) {
      AppLocale.en => strings.english,
      AppLocale.ar => strings.arabic,
    };
    final themeValue = switch (state.themeMode) {
      ThemeMode.system => strings.theme_system,
      ThemeMode.light => strings.theme_light,
      ThemeMode.dark => strings.theme_dark,
    };

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AppDecorativeBackground(
            topOpacity: .05,
            bottomOpacity: .035,
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppSize.contentMaxWidth,
                ),
                child: ListView(
                  padding: AppSpacing.pageWithBottom,
                  shrinkWrap: true,
                  children: [
                    Align(
                      child: SvgPicture.asset(
                        'assets/branding/muslim_scout_logo.svg',
                        width: AppSize.logoLg,
                        height: AppSize.logoLg,
                        colorFilter: ColorFilter.mode(
                          colors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    AppGap.verticalLg,
                    AppText.heading(
                      strings.title,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                    AppGap.verticalXs,
                    AppText.body(
                      strings.subtitle,
                      textAlign: TextAlign.center,
                      color: colors.onSurfaceVariant,
                    ),
                    AppGap.verticalXl,
                    AppButton.filled(
                      label: strings.get_started,
                      onPressed: () => _complete(context),
                    ),
                    AppGap.verticalXl,
                    AppSectionHeader(title: strings.preferences),
                    AppGap.verticalMd,
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          _PreferenceTile(
                            icon: Icons.language_rounded,
                            label: strings.language,
                            value: localeValue,
                            onTap: () => _showLanguageSheet(context),
                          ),
                          const Divider(height: 1),
                          _PreferenceTile(
                            icon: Icons.palette_outlined,
                            label: strings.appearance,
                            value: themeValue,
                            onTap: () => _showThemeSheet(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showLanguageSheet(BuildContext context) async {
    final strings = context.t.auth.welcome;
    final selectedLocale = LocaleSettings.currentLocale;

    final locale = await showModalBottomSheet<AppLocale>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      builder: (sheetContext) {
        return _SelectionSheet<AppLocale>(
          title: strings.language,
          selectedValue: selectedLocale,
          options: [
            _SelectionOption(
              value: AppLocale.en,
              label: strings.english,
            ),
            _SelectionOption(
              value: AppLocale.ar,
              label: strings.arabic,
            ),
          ],
        );
      },
    );

    if (locale != null && context.mounted) {
      await _changeLocale(context, locale);
    }
  }

  Future<void> _showThemeSheet(BuildContext context) async {
    final strings = context.t.auth.welcome;
    final selectedMode = context.read<ApplicationStartCubit>().state.themeMode;

    final mode = await showModalBottomSheet<ThemeMode>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      builder: (sheetContext) {
        return _ThemeSelectionSheet(
          title: strings.appearance,
          selectedValue: selectedMode,
          options: [
            _ThemeOption(
              value: ThemeMode.system,
              label: strings.theme_system,
              icon: Icons.settings_suggest_outlined,
            ),
            _ThemeOption(
              value: ThemeMode.light,
              label: strings.theme_light,
              icon: Icons.light_mode_outlined,
            ),
            _ThemeOption(
              value: ThemeMode.dark,
              label: strings.theme_dark,
              icon: Icons.dark_mode_outlined,
            ),
          ],
        );
      },
    );

    if (mode != null && context.mounted) {
      context.read<ApplicationStartCubit>().updateThemeMode(mode);
    }
  }

  Future<void> _changeLocale(BuildContext context, AppLocale locale) async {
    await LocaleSettings.setLocale(locale);

    if (!context.mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(locale.languageCode);
  }

  Future<void> _complete(BuildContext context) async {
    context.read<ApplicationStartCubit>().completeOnboarding();
    await context.router.replaceAll([const LoginRoute()]);
  }
}

class _PreferenceTile extends StatelessWidget {
  const _PreferenceTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Container(
              width: AppSize.controlSm,
              height: AppSize.controlSm,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: AppRadius.medium,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: AppSize.iconSm,
                color: colors.onPrimary,
              ),
            ),
            AppGap.horizontalMd,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body(label, fontWeight: FontWeight.w600),
                  AppGap.verticalXxs,
                  AppText.caption(
                    value,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
            AppGap.horizontalSm,
            Icon(
              Icons.chevron_right_rounded,
              color: colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectionSheet<T> extends StatelessWidget {
  const _SelectionSheet({
    required this.title,
    required this.selectedValue,
    required this.options,
  });

  final String title;
  final T selectedValue;
  final List<_SelectionOption<T>> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText.heading(title, fontWeight: FontWeight.w700),
          AppGap.verticalMd,
          RadioGroup<T>(
            groupValue: selectedValue,
            onChanged: (value) {
              Navigator.of(context).pop(value);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final option in options)
                  RadioListTile<T>(
                    value: option.value,
                    secondary: Icon(option.icon),
                    title: AppText.body(option.label),
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.medium,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeSelectionSheet extends StatelessWidget {
  const _ThemeSelectionSheet({
    required this.title,
    required this.selectedValue,
    required this.options,
  });

  final String title;
  final ThemeMode selectedValue;
  final List<_ThemeOption> options;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == .dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText.heading(title, fontWeight: FontWeight.w700),
          AppGap.verticalMd,
          for (final option in options)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: ListTile(
                selected: option.value == selectedValue,
                selectedTileColor: colors.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.medium,
                ),
                leading: Icon(
                  option.icon,
                  color: option.value == selectedValue
                      ? colors.onPrimary
                      : isDark
                      ? colors.onPrimary
                      : colors.primary,
                ),
                title: AppText.body(
                  option.label,
                  fontWeight: option.value == selectedValue
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: option.value == selectedValue
                      ? colors.onPrimary
                      : isDark
                      ? colors.onPrimary
                      : colors.primary,
                ),
                trailing: option.value == selectedValue
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: colors.onPrimary,
                      )
                    : null,
                onTap: () => Navigator.of(context).pop(option.value),
              ),
            ),
        ],
      ),
    );
  }
}

final class _SelectionOption<T> {
  const _SelectionOption({
    required this.value,
    required this.label,
    this.icon,
  });

  final T value;
  final String label;
  final IconData? icon;
}

final class _ThemeOption {
  const _ThemeOption({
    required this.value,
    required this.label,
    required this.icon,
  });

  final ThemeMode value;
  final String label;
  final IconData icon;
}
