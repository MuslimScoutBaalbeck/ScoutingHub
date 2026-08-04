import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  });

  Future<AuthResponseDto> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  });

  Future<AuthResponseDto?> restoreSession();

  Future<void> logout();
}
