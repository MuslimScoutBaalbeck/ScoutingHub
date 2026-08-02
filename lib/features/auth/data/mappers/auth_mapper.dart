import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_user.dart';

extension AuthResponseDtoMapper on AuthResponseDto {
  AuthSession toDomain() {
    return AuthSession(
      accessToken: token,
      user: AuthUser(
        id: user.id,
        name: user.name,
        email: user.email,
      ),
    );
  }
}
