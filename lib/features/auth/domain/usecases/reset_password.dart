import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/repositories/auth_repository.dart';

@singleton
final class ResetPasswordUseCase {
  const ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, Unit>> call({
    required String email,
    required String code,
    required String password,
  }) {
    return _repository.resetPassword(
      email: email.trim().toLowerCase(),
      code: code.trim(),
      password: password,
    );
  }
}
