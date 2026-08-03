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
import '../../features/auth/application/forgot_password/forgot_password_cubit.dart'
    as _i259;
import '../../features/auth/application/login/login_cubit.dart' as _i99;
import '../../features/auth/application/register/register_cubit.dart' as _i777;
import '../../features/auth/application/reset_password/reset_password_cubit.dart'
    as _i1054;
import '../../features/auth/application/session/session_cubit.dart' as _i329;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/fake_auth_remote_data_source.dart'
    as _i305;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/forgot_password.dart' as _i510;
import '../../features/auth/domain/usecases/login.dart' as _i428;
import '../../features/auth/domain/usecases/logout.dart' as _i597;
import '../../features/auth/domain/usecases/register.dart' as _i480;
import '../../features/auth/domain/usecases/reset_password.dart' as _i1066;
import '../../features/auth/domain/usecases/restore_session.dart' as _i456;
import '../../features/organizations/data/datasources/fake_organizations_data_source.dart'
    as _i63;
import '../../features/organizations/data/datasources/organizations_data_source.dart'
    as _i664;
import '../../features/people/application/member_create/member_create_cubit.dart'
    as _i949;
import '../../features/people/application/member_edit/member_edit_cubit.dart'
    as _i31;
import '../../features/people/application/members_dashboard/members_dashboard_cubit.dart'
    as _i112;
import '../../features/people/application/members_list/members_list_cubit.dart'
    as _i79;
import '../../features/people/data/datasources/fake_people_data_source.dart'
    as _i957;
import '../../features/people/data/repositories/fake_people_repository.dart'
    as _i606;
import '../../features/people/domain/repositories/people_repository.dart'
    as _i646;
import '../../features/people/domain/usecases/load_people_use_case.dart'
    as _i181;
import '../../features/people/domain/usecases/save_person_use_case.dart'
    as _i535;
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
  gh.lazySingleton<_i957.FakePeopleDataSource>(
    () => _i957.FakePeopleDataSource(),
  );
  gh.lazySingleton<_i664.OrganizationsDataSource>(
    () => _i63.FakeOrganizationsDataSource(),
  );
  gh.lazySingleton<_i107.AuthRemoteDataSource>(
    () => _i305.FakeAuthRemoteDataSource(),
  );
  gh.factory<_i787.AuthRepository>(
    () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
  );
  gh.lazySingleton<_i646.PeopleRepository>(
    () => _i606.FakePeopleRepository(gh<_i957.FakePeopleDataSource>()),
  );
  gh.factory<_i181.LoadPeopleUseCase>(
    () => _i181.LoadPeopleUseCase(gh<_i646.PeopleRepository>()),
  );
  gh.factory<_i535.SavePersonUseCase>(
    () => _i535.SavePersonUseCase(gh<_i646.PeopleRepository>()),
  );
  gh.factory<_i949.MemberCreateCubit>(
    () => _i949.MemberCreateCubit(gh<_i535.SavePersonUseCase>()),
  );
  gh.factory<_i31.MemberEditCubit>(
    () => _i31.MemberEditCubit(gh<_i535.SavePersonUseCase>()),
  );
  gh.singleton<_i510.ForgotPasswordUseCase>(
    () => _i510.ForgotPasswordUseCase(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i428.LoginUseCase>(
    () => _i428.LoginUseCase(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i597.LogoutUseCase>(
    () => _i597.LogoutUseCase(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i480.RegisterUseCase>(
    () => _i480.RegisterUseCase(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i1066.ResetPasswordUseCase>(
    () => _i1066.ResetPasswordUseCase(gh<_i787.AuthRepository>()),
  );
  gh.singleton<_i456.RestoreSessionUseCase>(
    () => _i456.RestoreSessionUseCase(gh<_i787.AuthRepository>()),
  );
  gh.factory<_i99.LoginCubit>(() => _i99.LoginCubit(gh<_i428.LoginUseCase>()));
  gh.factory<_i112.MembersDashboardCubit>(
    () => _i112.MembersDashboardCubit(gh<_i181.LoadPeopleUseCase>()),
  );
  gh.factory<_i79.MembersListCubit>(
    () => _i79.MembersListCubit(gh<_i181.LoadPeopleUseCase>()),
  );
  gh.factory<_i777.RegisterCubit>(
    () => _i777.RegisterCubit(gh<_i480.RegisterUseCase>()),
  );
  gh.factory<_i795.AuthCubit>(
    () => _i795.AuthCubit(
      loginUseCase: gh<_i428.LoginUseCase>(),
      registerUseCase: gh<_i480.RegisterUseCase>(),
      restoreSessionUseCase: gh<_i456.RestoreSessionUseCase>(),
      logoutUseCase: gh<_i597.LogoutUseCase>(),
      forgotPasswordUseCase: gh<_i510.ForgotPasswordUseCase>(),
      resetPasswordUseCase: gh<_i1066.ResetPasswordUseCase>(),
    ),
  );
  gh.factory<_i1054.ResetPasswordCubit>(
    () => _i1054.ResetPasswordCubit(gh<_i1066.ResetPasswordUseCase>()),
  );
  gh.factory<_i259.ForgotPasswordCubit>(
    () => _i259.ForgotPasswordCubit(gh<_i510.ForgotPasswordUseCase>()),
  );
  gh.singleton<_i329.SessionCubit>(
    () => _i329.SessionCubit(
      gh<_i456.RestoreSessionUseCase>(),
      gh<_i597.LogoutUseCase>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
