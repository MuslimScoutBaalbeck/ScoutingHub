part of 'reset_password_cubit.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    AuthErrorKey? error,
  }) = _ResetPasswordState;
}
