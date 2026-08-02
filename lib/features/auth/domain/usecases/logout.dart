import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/repositories/auth_repository.dart';

@singleton
final class Logout {
  const Logout(this._repository);

  final AuthRepository _repository;

  Future<Either<AuthFailure, Unit>> call() {
    return _repository.logout();
  }
}
