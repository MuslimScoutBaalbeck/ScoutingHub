import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:forui/forui.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.dart';
import 'package:scouting_hub/core/ui/theme/scouting_hub_theme.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

class AppStart extends StatelessWidget {
  AppStart({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    final themes = ScoutingHubTheme.forPlatform(defaultTargetPlatform);
    final lightTheme = themes.light;
    final darkTheme = themes.dark;

    return BlocBuilder<ApplicationStartCubit, ApplicationStartState>(
      builder: (context, state) {
        final locale = TranslationProvider.of(context).flutterLocale;

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightTheme.toApproximateMaterialTheme(),
          darkTheme: darkTheme.toApproximateMaterialTheme(),
          themeMode: state.themeMode,
          locale: locale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const [
            ...FLocalizations.localizationsDelegates,
            ...GlobalMaterialLocalizations.delegates,
            LocaleNamesLocalizationsDelegate(),
          ],
          builder: (context, child) {
            final appChild = child ?? const SizedBox.shrink();
            final activeTheme = Theme.brightnessOf(context) == Brightness.light
                ? lightTheme
                : darkTheme;

            return FTheme(
              data: activeTheme,
              child: FToaster(
                child: FTooltipGroup(
                  child: state.isLoadingLanguage
                      ? FScaffold(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 280),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const FCircularProgress(),
                                  const SizedBox(height: 16),
                                  Text(
                                    context.t.language.wait,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : appChild,
                ),
              ),
            );
          },
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
