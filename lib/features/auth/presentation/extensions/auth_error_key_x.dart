import 'package:flutter/widgets.dart';
import 'package:scouting_hub/core/i18n/translations.g.dart';
import 'package:scouting_hub/features/auth/application/errors/auth_error_key.dart';

extension AuthErrorKeyX on AuthErrorKey {
  String translate(BuildContext context) {
    final errors = context.t.auth.errors;

    return switch (this) {
      AuthErrorKey.emailRequired => errors.email_required,
      AuthErrorKey.emailPasswordRequired => errors.email_password_required,
      AuthErrorKey.registrationFieldsInvalid =>
        errors.registration_fields_invalid,
      AuthErrorKey.passwordMismatch => errors.password_mismatch,
      AuthErrorKey.resetFieldsInvalid => errors.reset_fields_invalid,
      AuthErrorKey.invalidCredentials => errors.invalid_credentials,
      AuthErrorKey.emailAlreadyExists => errors.email_already_exists,
      AuthErrorKey.invalidResetCode => errors.invalid_reset_code,
      AuthErrorKey.unauthenticated => errors.unauthenticated,
      AuthErrorKey.unexpected => errors.unexpected,
    };
  }
}
