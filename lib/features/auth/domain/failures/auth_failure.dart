sealed class AuthFailure {
  const AuthFailure(this.message);

  final String message;
}

final class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure()
    : super('The provided credentials are incorrect.');
}

final class EmailAlreadyExistsFailure extends AuthFailure {
  const EmailAlreadyExistsFailure()
    : super('An account already exists for this email address.');
}

final class InvalidResetCodeFailure extends AuthFailure {
  const InvalidResetCodeFailure()
    : super('The password reset code is invalid.');
}

final class ValidationFailure extends AuthFailure {
  const ValidationFailure(super.message);
}

final class UnauthenticatedFailure extends AuthFailure {
  const UnauthenticatedFailure() : super('No authenticated session exists.');
}

final class UnexpectedAuthFailure extends AuthFailure {
  const UnexpectedAuthFailure([
    super.message = 'An unexpected error occurred.',
  ]);
}
