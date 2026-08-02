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
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required RestoreSession restoreSessionUseCase,
    required Logout logoutUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       _restoreSessionUseCase = restoreSessionUseCase,
       _logoutUseCase = logoutUseCase,
       _forgotPasswordUseCase = forgotPasswordUseCase,
       _resetPasswordUseCase = resetPasswordUseCase,
       super(const AuthInitial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final RestoreSession _restoreSessionUseCase;
  final Logout _logoutUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> restore() async {
    emit(const AuthLoading());
    final result = await _restoreSessionUseCase();
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(
        session == null
            ? const AuthUnauthenticated()
            : AuthAuthenticated(session),
      ),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(email: email, password: password);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(AuthAuthenticated(session)),
    );
  }

  Future<void> register({required String name, required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _registerUseCase(name: name, email: email, password: password);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (session) => emit(AuthAuthenticated(session)),
    );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(const AuthLoading());
    final result = await _forgotPasswordUseCase(email: email);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthActionSuccess(AuthAction.forgotPassword)),
    );
  }

  Future<void> resetPassword({required String email, required String code, required String password}) async {
    emit(const AuthLoading());
    final result = await _resetPasswordUseCase(email: email, code: code, password: password);
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthActionSuccess(AuthAction.resetPassword)),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logoutUseCase();
    result.match(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthUnauthenticated()),
    );
  }
}
