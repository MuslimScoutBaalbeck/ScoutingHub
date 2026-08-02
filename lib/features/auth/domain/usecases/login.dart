import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/repositories/auth_repository.dart';

@singleton
final class Login {
  const Login(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, AuthSession>> call({
    required String email,
    required String password,
  }) {
    return _repository.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }
}
