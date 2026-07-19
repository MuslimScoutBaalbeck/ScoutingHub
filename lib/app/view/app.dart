import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:forui/forui.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

class AppStart extends StatelessWidget {
  AppStart({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    final (lightTheme, darkTheme) =
        const <TargetPlatform>{
          .android,
          .iOS,
          .fuchsia,
        }.contains(defaultTargetPlatform)
        ? (FTheme.neutral.light.touch, FTheme.neutral.dark.touch)
        : (FTheme.neutral.light.desktop, FTheme.neutral.dark.desktop);
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

            if (state.isLoadingLanguage) {
              return FTheme(
                data: Theme.brightnessOf(context) == .light
                    ? lightTheme
                    : darkTheme,
                child: FToaster(
                  child: FTooltipGroup(
                    child: Scaffold(
                      body: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 280),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.t.language.wait,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              const LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            return FTheme(
              data: Theme.brightnessOf(context) == .light
                  ? lightTheme
                  : darkTheme,
              child: FToaster(child: FTooltipGroup(child: appChild)),
            );
          },
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
