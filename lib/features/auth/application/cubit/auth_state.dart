import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.session);

  final AuthSession session;
}

final class AuthActionSuccess extends AuthState {
  const AuthActionSuccess(this.action);

  final AuthAction action;
}

enum AuthAction {
  forgotPassword,
  resetPassword,
}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;
}
