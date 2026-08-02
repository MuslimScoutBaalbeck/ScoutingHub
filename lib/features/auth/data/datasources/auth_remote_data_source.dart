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
  });

  Future<AuthResponseDto?> restoreSession();

  Future<void> logout();
}
