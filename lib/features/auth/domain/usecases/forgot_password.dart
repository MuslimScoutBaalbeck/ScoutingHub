import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/repositories/auth_repository.dart';

@singleton
final class ForgotPassword {
  const ForgotPassword(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, Unit>> call({required String email}) {
    return _repository.forgotPassword(email: email.trim().toLowerCase());
  }
}
