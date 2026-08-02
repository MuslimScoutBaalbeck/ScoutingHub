import 'package:fpdart/fpdart.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';

abstract interface class AuthRepository {
  Future<Either<AuthFailure, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, AuthSession>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, AuthSession?>> restoreSession();

  Future<Either<AuthFailure, Unit>> logout();
}
