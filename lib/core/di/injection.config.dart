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

import '../../features/auth/application/cubit/auth_cubit.dart' as _i795;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/fake_auth_remote_data_source.dart'
    as _i305;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login.dart' as _i428;
import '../../features/auth/domain/usecases/logout.dart' as _i597;
import '../../features/auth/domain/usecases/register.dart' as _i480;
import '../../features/auth/domain/usecases/restore_session.dart' as _i456;
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
  gh.factory<_i107.AuthRemoteDataSource>(
    () => _i305.FakeAuthRemoteDataSource(delay: gh<Duration>()),
  );
  gh.factory<_i787.AuthRepository>(
    () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
  );
  gh.singleton<_i428.Login>(() => _i428.Login(gh<_i787.AuthRepository>()));
  gh.singleton<_i597.Logout>(() => _i597.Logout(gh<_i787.AuthRepository>()));
  gh.singleton<_i480.Register>(
    () => _i480.Register(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i456.RestoreSession>(
    () => _i456.RestoreSession(gh<_i787.AuthRepository>()),
  );
  gh.factory<_i795.AuthCubit>(
    () => _i795.AuthCubit(
      login: gh<_i428.Login>(),
      register: gh<_i480.Register>(),
      restoreSession: gh<_i456.RestoreSession>(),
      logout: gh<_i597.Logout>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
