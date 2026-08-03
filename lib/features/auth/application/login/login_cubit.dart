import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/application/errors/auth_error_key.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/usecases/login.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
final class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  Future<void> submit({required String email, required String password}) async {
    if (email.trim().isEmpty || password.isEmpty) {
      emit(state.copyWith(error: AuthErrorKey.emailPasswordRequired));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null));
    final result = await _loginUseCase(email: email, password: password);
    result.match(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: _mapFailure(failure))),
      (session) => emit(state.copyWith(isLoading: false, session: session)),
    );
  }

  AuthErrorKey _mapFailure(AuthFailure failure) => switch (failure) {
    InvalidCredentialsFailure() => AuthErrorKey.invalidCredentials,
    UnauthenticatedFailure() => AuthErrorKey.unauthenticated,
    _ => AuthErrorKey.unexpected,
  };
}
