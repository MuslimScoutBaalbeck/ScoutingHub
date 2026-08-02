part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    AuthSession? session,
    AuthErrorKey? error,
  }) = _LoginState;
}
