import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/datasources/laravel_auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/mappers/auth_mapper.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<AuthFailure, AuthSession>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(response.toDomain());
    } on InvalidCredentialsException {
      return const Left(InvalidCredentialsFailure());
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, AuthSession>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(response.toDomain());
    } on EmailAlreadyExistsException {
      return const Left(EmailAlreadyExistsFailure());
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> forgotPassword({
    required String email,
  }) async {
    try {
      await _remoteDataSource.forgotPassword(email: email);
      return const Right(unit);
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
        email: email,
        code: code,
        password: password,
      );
      return const Right(unit);
    } on InvalidResetCodeException {
      return const Left(InvalidResetCodeFailure());
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, AuthSession?>> restoreSession() async {
    try {
      final response = await _remoteDataSource.restoreSession();
      return Right(response?.toDomain());
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(unit);
    } on Exception {
      return const Left(UnexpectedAuthFailure());
    }
  }
}
