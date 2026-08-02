import 'package:scouting_hub/features/auth/data/dtos/auth_user_dto.dart';

final class AuthResponseDto {
  const AuthResponseDto({
    required this.token,
    required this.tokenType,
    required this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: AuthUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String token;
  final String tokenType;
  final AuthUserDto user;
}
