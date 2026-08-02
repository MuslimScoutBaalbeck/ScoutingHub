part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    AuthSession? session,
    AuthErrorKey? error,
  }) = _RegisterState;
}
