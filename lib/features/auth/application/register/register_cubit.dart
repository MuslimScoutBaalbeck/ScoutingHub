import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/application/errors/auth_error_key.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/failures/auth_failure.dart';
import 'package:scouting_hub/features/auth/domain/usecases/register.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

@injectable
final class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(const RegisterState());

  final RegisterUseCase _registerUseCase;

  Future<void> submit({
    required String name,
    required String email,
    required String password,
    required String confirmation,
  }) async {
    if (password != confirmation) {
      emit(state.copyWith(error: AuthErrorKey.passwordMismatch));
      return;
    }
    if (name.trim().isEmpty || email.trim().isEmpty || password.length < 8) {
      emit(state.copyWith(error: AuthErrorKey.registrationFieldsInvalid));
      return;
    }
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _registerUseCase(
      name: name,
      email: email,
      password: password,
    );
    result.match(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: _mapFailure(failure))),
      (session) => emit(state.copyWith(isLoading: false, session: session)),
    );
  }

  AuthErrorKey _mapFailure(AuthFailure failure) => switch (failure) {
    EmailAlreadyExistsFailure() => AuthErrorKey.emailAlreadyExists,
    _ => AuthErrorKey.unexpected,
  };
}
