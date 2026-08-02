import 'package:scouting_hub/features/auth/domain/entities/auth_user.dart';

final class AuthSession {
  const AuthSession({
    required this.user,
    required this.accessToken,
  });

  final AuthUser user;
  final String accessToken;
}
