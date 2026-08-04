import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';
import 'package:scouting_hub/features/auth/data/dtos/auth_user_dto.dart';

final class LoginRequestModel {
  const LoginRequestModel({
    required this.email,
    required this.password,
    required this.deviceName,
  });

  final String email;
  final String password;
  final String deviceName;

  Map<String, Object?> toJson() => {
    'email': email,
    'password': password,
    'device_name': deviceName,
  };
}

final class RegisterRequestModel {
  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.deviceName,
  });

  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String deviceName;

  Map<String, Object?> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'device_name': deviceName,
  };
}

final class ForgotPasswordRequestModel {
  const ForgotPasswordRequestModel({required this.email});

  final String email;

  Map<String, Object?> toJson() => {'email': email};
}

final class ResetPasswordRequestModel {
  const ResetPasswordRequestModel({
    required this.email,
    required this.token,
    required this.password,
    required this.passwordConfirmation,
  });

  final String email;
  final String token;
  final String password;
  final String passwordConfirmation;

  Map<String, Object?> toJson() => {
    'email': email,
    'token': token,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };
}

final class AuthSessionResponseModel {
  const AuthSessionResponseModel({required this.data});

  factory AuthSessionResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    if (rawData is! Map) {
      throw const FormatException('Missing authentication payload.');
    }

    return AuthSessionResponseModel(
      data: AuthResponseDto.fromJson(Map<String, dynamic>.from(rawData)),
    );
  }

  final AuthResponseDto data;
}

final class AuthUserResponseModel {
  const AuthUserResponseModel({required this.data});

  factory AuthUserResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    if (rawData is! Map) {
      throw const FormatException('Missing user payload.');
    }

    return AuthUserResponseModel(
      data: AuthUserDto.fromJson(Map<String, dynamic>.from(rawData)),
    );
  }

  final AuthUserDto data;
}

final class VerificationStatusModel {
  const VerificationStatusModel({
    required this.verified,
    this.emailVerifiedAt,
  });

  factory VerificationStatusModel.fromJson(Map<String, dynamic> json) {
    return VerificationStatusModel(
      verified: json['verified'] as bool? ?? false,
      emailVerifiedAt: json['email_verified_at'] as String?,
    );
  }

  final bool verified;
  final String? emailVerifiedAt;
}

final class VerificationResponseModel {
  const VerificationResponseModel({
    required this.data,
    this.message,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    return VerificationResponseModel(
      data: rawData is Map
          ? VerificationStatusModel.fromJson(
              Map<String, dynamic>.from(rawData),
            )
          : const VerificationStatusModel(verified: false),
      message: json['message'] as String?,
    );
  }

  final VerificationStatusModel data;
  final String? message;
}

final class MessageResponseModel {
  const MessageResponseModel({required this.message});

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(message: json['message'] as String? ?? '');
  }

  final String message;
}

final class ApiErrorResponseModel {
  const ApiErrorResponseModel({
    required this.message,
    this.code,
    this.errors = const {},
  });

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    final rawErrors = json['errors'];
    final errors = <String, List<String>>{};

    if (rawErrors is Map) {
      for (final entry in rawErrors.entries) {
        final value = entry.value;
        errors[entry.key.toString()] = value is List
            ? value.map((item) => item.toString()).toList(growable: false)
            : [value.toString()];
      }
    }

    return ApiErrorResponseModel(
      message: json['message'] as String? ?? 'Unexpected server error.',
      code: json['code'] as String?,
      errors: errors,
    );
  }

  final String message;
  final String? code;
  final Map<String, List<String>> errors;

  bool hasError(String field) => errors.containsKey(field);
}
