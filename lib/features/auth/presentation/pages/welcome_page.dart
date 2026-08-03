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
                    AppButton.action(
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
                          _PreferenceDropdownRow<AppLocale>(
                            icon: Icons.language_rounded,
                            label: strings.language,
                            value: LocaleSettings.currentLocale,
                            items: [
                              DropdownMenuItem(
                                value: AppLocale.en,
                                child: Text(strings.english),
                              ),
                              DropdownMenuItem(
                                value: AppLocale.ar,
                                child: Text(strings.arabic),
                              ),
                            ],
                            onChanged: (locale) async {
                              if (locale != null) {
                                await _changeLocale(context, locale);
                              }
                            },
                          ),
                          const Divider(height: 1),
                          _PreferenceDropdownRow<ThemeMode>(
                            icon: Icons.palette_outlined,
                            label: strings.appearance,
                            value: state.themeMode,
                            items: [
                              DropdownMenuItem(
                                value: ThemeMode.system,
                                child: Text(strings.theme_system),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.light,
                                child: Text(strings.theme_light),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.dark,
                                child: Text(strings.theme_dark),
                              ),
                            ],
                            onChanged: (mode) {
                              if (mode != null) {
                                context
                                    .read<ApplicationStartCubit>()
                                    .updateThemeMode(mode);
                              }
                            },
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

  Future<void> _changeLocale(BuildContext context, AppLocale locale) async {
    await LocaleSettings.setLocale(locale);

    if (!context.mounted) {
      return;
    }

    context.read<ApplicationStartCubit>().updateLocale(locale.languageCode);
  }

  Future<void> _complete(BuildContext context) async {
    context.read<ApplicationStartCubit>().completeOnboarding();
    await context.router.push(const LoginRoute());
  }
}

class _PreferenceDropdownRow<T> extends StatelessWidget {
  const _PreferenceDropdownRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Icon(
            icon,
            size: AppSize.iconMd,
            color: colors.onSurfaceVariant,
          ),
          AppGap.horizontalSm,
          SizedBox(
            width: 82,
            child: AppText.body(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AppGap.horizontalMd,
          Expanded(
            child: DropdownButtonFormField<T>(
              initialValue: value,
              isExpanded: true,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
              ),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
