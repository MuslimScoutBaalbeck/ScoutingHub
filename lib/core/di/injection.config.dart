// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/startup/application/application_start/application_start_cubit.dart'
    as _i123;
import '../database/database.dart' as _i660;
import '../router/app_router.dart' as _i81;
import 'app_module.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i660.AppDatabase>(() => appModule.myDb);
  gh.singleton<_i81.AppRouter>(() => appModule.appRouter);
  gh.singleton<_i123.ApplicationStartCubit>(
    () => _i123.ApplicationStartCubit(),
  );
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
