import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/router/app_router.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

class AppStart extends StatelessWidget {
  AppStart({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationStartCubit, ApplicationStartState>(
      builder: (context, state) {
        final locale = TranslationProvider.of(context).flutterLocale;

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          locale: locale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const [
            ...GlobalMaterialLocalizations.delegates,
            LocaleNamesLocalizationsDelegate(),
          ],
          builder: (context, child) {
            final appChild = child ?? const SizedBox.shrink();

            if (state.isLoadingLanguage) {
              return Scaffold(
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
              );
            }

            return appChild;
          },
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
