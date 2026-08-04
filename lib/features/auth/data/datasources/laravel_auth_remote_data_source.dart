import 'package:injectable/injectable.dart';
import 'package:scouting_hub/core/network/token_storage.dart';
import 'package:scouting_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';
import 'package:scouting_hub/features/auth/data/services/auth_api_service.dart';

final class InvalidCredentialsException implements Exception {}

final class EmailAlreadyExistsException implements Exception {}

final class InvalidResetCodeException implements Exception {}

final class UnauthenticatedException implements Exception {}

final class AuthApiException implements Exception {
  const AuthApiException(this.statusCode, [this.message]);

  final int statusCode;
  final String? message;
}

@LazySingleton(as: AuthRemoteDataSource)
final class LaravelAuthRemoteDataSource implements AuthRemoteDataSource {
  const LaravelAuthRemoteDataSource(this._api, this._tokenStorage);

  final AuthApiService _api;
  final TokenStorage _tokenStorage;

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.login({
      'email': email.trim().toLowerCase(),
      'password': password,
      'device_name': 'scouting-hub-mobile',
    });

    if (response.response.statusCode == 401 ||
        response.response.statusCode == 422) {
      throw InvalidCredentialsException();
    }

    final dto = _parseAuthResponse(response.data, response.response.statusCode);
    await _tokenStorage.writeAccessToken(dto.token);
    return dto;
  }

  @override
  Future<AuthResponseDto> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _api.register({
      'name': name.trim(),
      'email': email.trim().toLowerCase(),
      'password': password,
      'password_confirmation': password,
      'device_name': 'scouting-hub-mobile',
    });

    if (response.response.statusCode == 422 &&
        _hasEmailValidationError(response.data)) {
      throw EmailAlreadyExistsException();
    }

    final dto = _parseAuthResponse(response.data, response.response.statusCode);
    await _tokenStorage.writeAccessToken(dto.token);
    return dto;
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    final response = await _api.forgotPassword({
      'email': email.trim().toLowerCase(),
    });
    _ensureSuccess(response.response.statusCode, response.data);
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    final response = await _api.resetPassword({
      'email': email.trim().toLowerCase(),
      'token': code,
      'password': password,
      'password_confirmation': password,
    });

    if (response.response.statusCode == 422) {
      throw InvalidResetCodeException();
    }

    _ensureSuccess(response.response.statusCode, response.data);
  }

  @override
  Future<AuthResponseDto?> restoreSession() async {
    final token = await _tokenStorage.readAccessToken();
    if (token == null || token.isEmpty) {
      return null;
    }

    final response = await _api.me();
    if (response.response.statusCode == 401) {
      await _tokenStorage.clearAccessToken();
      return null;
    }

    _ensureSuccess(response.response.statusCode, response.data);
    final data = _unwrapData(response.data);
    final user = data['user'] is Map<String, dynamic>
        ? data['user'] as Map<String, dynamic>
        : data;

    return AuthResponseDto.fromJson({
      'token': token,
      'token_type': 'Bearer',
      'user': user,
    });
  }

  @override
  Future<void> logout() async {
    try {
      final response = await _api.logout();
      _ensureSuccess(response.response.statusCode, response.data);
    } finally {
      await _tokenStorage.clearAccessToken();
    }
  }

  AuthResponseDto _parseAuthResponse(
    Map<String, dynamic> body,
    int? statusCode,
  ) {
    _ensureSuccess(statusCode, body);
    return AuthResponseDto.fromJson(_unwrapData(body));
  }

  Map<String, dynamic> _unwrapData(Map<String, dynamic> body) {
    final data = body['data'];
    return data is Map<String, dynamic> ? data : body;
  }

  bool _hasEmailValidationError(Map<String, dynamic> body) {
    final errors = body['errors'];
    return errors is Map<String, dynamic> && errors.containsKey('email');
  }

  void _ensureSuccess(int? statusCode, Map<String, dynamic> body) {
    if (statusCode != null && statusCode >= 200 && statusCode < 300) {
      return;
    }

    throw AuthApiException(
      statusCode ?? 0,
      body['message'] as String?,
    );
  }
}
