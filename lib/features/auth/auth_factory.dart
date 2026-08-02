import 'package:scouting_hub/features/auth/application/cubit/auth_cubit.dart';
import 'package:scouting_hub/features/auth/data/datasources/fake_auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scouting_hub/features/auth/domain/usecases/login.dart';
import 'package:scouting_hub/features/auth/domain/usecases/logout.dart';
import 'package:scouting_hub/features/auth/domain/usecases/register.dart';
import 'package:scouting_hub/features/auth/domain/usecases/restore_session.dart';

AuthCubit createFakeAuthCubit() {
  final dataSource = FakeAuthRemoteDataSource();
  final repository = AuthRepositoryImpl(dataSource);

  return AuthCubit(
    login: Login(repository),
    register: Register(repository),
    restoreSession: RestoreSession(repository),
    logout: Logout(repository),
  );
}
