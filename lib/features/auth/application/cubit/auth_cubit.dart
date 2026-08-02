import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/application/cubit/auth_state.dart';
import 'package:scouting_hub/features/auth/domain/usecases/forgot_password.dart';
import 'package:scouting_hub/features/auth/domain/usecases/login.dart';
import 'package:scouting_hub/features/auth/domain/usecases/logout.dart';
import 'package:scouting_hub/features/auth/domain/usecases/register.dart';
import 'package:scouting_hub/features/auth/domain/usecases/reset_password.dart';
import 'package:scouting_hub/features/auth/domain/usecases/restore_session.dart';

@injectable
final class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required Login login,
    required Register register,
    required RestoreSession restoreSession,
    required Logout logout,
    required ForgotPassword forgotPassword,
    required ResetPassword resetPassword,
  })  : _login = login,
        _register = register,
        _restoreSession = restoreSession,
        _logout = logout,
        _forgotPassword = forgotPassword,
        _resetPassword = resetPassword,
        super(const AuthInitial());

  final Login _login;
  final Register _register;
  final RestoreSession _restoreSession;
  final Logout _logout;
  final ForgotPassword _forgotPassword;
  final ResetPassword _resetPassword;

  Future<void> restore() async {
    emit(const AuthLoading());
    final result = await _restoreSession();
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(
        session == null
            ? const AuthUnauthenticated()
            : AuthAuthenticated(session),
      ),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (email.trim().isEmpty || password.isEmpty) {
      emit(const AuthError('Email and password are required.'));
      return;
    }

    emit(const AuthLoading());
    final result = await _login(email: email, password: password);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(AuthAuthenticated(session)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (name.trim().isEmpty || email.trim().isEmpty || password.length < 8) {
      emit(
        const AuthError(
          'Name and email are required, and password must contain at least 8 characters.',
        ),
      );
      return;
    }

    emit(const AuthLoading());
    final result = await _register(
      name: name,
      email: email,
      password: password,
    );
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(AuthAuthenticated(session)),
    );
  }

  Future<void> forgotPassword({required String email}) async {
    if (email.trim().isEmpty) {
      emit(const AuthError('Email is required.'));
      return;
    }

    emit(const AuthLoading());
    final result = await _forgotPassword(email: email);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthActionSuccess(AuthAction.forgotPassword)),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    if (email.trim().isEmpty || code.trim().isEmpty || password.length < 8) {
      emit(const AuthError('Complete all fields correctly.'));
      return;
    }

    emit(const AuthLoading());
    final result = await _resetPassword(
      email: email,
      code: code,
      password: password,
    );
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthActionSuccess(AuthAction.resetPassword)),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logout();
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthUnauthenticated()),
    );
  }

  void clearError() {
    if (state is AuthError || state is AuthActionSuccess) {
      emit(const AuthUnauthenticated());
    }
  }
}
