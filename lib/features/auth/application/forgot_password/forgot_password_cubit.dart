import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/application/errors/auth_error_key.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/usecases/forgot_password.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

@injectable
final class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(const ForgotPasswordState());

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  Future<void> submit({required String email}) async {
    if (email.trim().isEmpty) {
      emit(state.copyWith(error: AuthErrorKey.emailRequired));
      return;
    }

    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    final result = await _forgotPasswordUseCase(email: email);
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
    UnauthenticatedFailure() => AuthErrorKey.unauthenticated,
    _ => AuthErrorKey.unexpected,
  };
}
