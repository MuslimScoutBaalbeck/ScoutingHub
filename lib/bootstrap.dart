import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scouting_hub/core/database/connection/native.dart'
    as database_connection;
import 'package:scouting_hub/core/di/injection.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/core/utils/observer/bloc_observer.dart';
import 'package:scouting_hub/features/startup/application/application_start/application_start_cubit.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationSupportDirectory()).path,
          ),
  );

  await database_connection.deleteDatabaseBeforeOpen();

  configureDependencies();

  Bloc.observer = const AppBlocObserver();

  final applicationStartCubit = getIt<ApplicationStartCubit>();

  final currentLocale =
      applicationStartCubit.state.locale ??
      LocaleSettings.useDeviceLocaleSync().languageCode;

  await LocaleSettings.setLocaleRaw(currentLocale);

  runApp(
    TranslationProvider(
      child: MultiBlocProvider(
        providers: [BlocProvider.value(value: applicationStartCubit)],
        child: await builder(),
      ),
    ),
  );
}
