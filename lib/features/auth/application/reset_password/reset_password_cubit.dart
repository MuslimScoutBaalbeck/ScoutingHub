import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/application/errors/auth_error_key.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/usecases/reset_password.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

@injectable
final class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordUseCase)
    : super(const ResetPasswordState());

  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> submit({
    required String email,
    required String code,
    required String password,
    required String confirmation,
  }) async {
    if (password != confirmation) {
      emit(state.copyWith(error: AuthErrorKey.passwordMismatch));
      return;
    }
    if (email.trim().isEmpty || code.trim().isEmpty || password.length < 8) {
      emit(state.copyWith(error: AuthErrorKey.resetFieldsInvalid));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    final result = await _resetPasswordUseCase(
      email: email,
      code: code,
      password: password,
    );
    result.match(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          error: _mapFailure(failure),
        ),
      ),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  AuthErrorKey _mapFailure(AuthFailure failure) => switch (failure) {
    InvalidResetCodeFailure() => AuthErrorKey.invalidResetCode,
    _ => AuthErrorKey.unexpected,
  };
}
