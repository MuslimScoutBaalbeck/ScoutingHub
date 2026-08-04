import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/core/network/token_storage.dart';
import 'package:scouting_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';
import 'package:scouting_hub/features/auth/data/models/auth_api_models.dart';
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

  static const _deviceName = 'scouting-hub-mobile';
  final AuthApiService _api;
  final TokenStorage _tokenStorage;

  @override
  Future<AuthResponseDto> login({required String email, required String password}) async {
    try {
      final response = await _api.login(LoginRequestModel(
        email: email.trim().toLowerCase(),
        password: password,
        deviceName: _deviceName,
      ));
      final dto = response.data.data;
      await _tokenStorage.writeAccessToken(dto.token);
      return dto;
    } on DioException catch (error) {
      if (error.response?.statusCode == 401 || error.response?.statusCode == 422) {
        throw InvalidCredentialsException();
      }
      throw _apiException(error);
    }
  }

  @override
  Future<AuthResponseDto> register({required String name, required String email, required String password}) async {
    try {
      final response = await _api.register(RegisterRequestModel(
        name: name.trim(),
        email: email.trim().toLowerCase(),
        password: password,
        passwordConfirmation: password,
        deviceName: _deviceName,
      ));
      final dto = response.data.data;
      await _tokenStorage.writeAccessToken(dto.token);
      return dto;
    } on DioException catch (error) {
      final apiError = _errorModel(error);
      if (error.response?.statusCode == 422 && apiError.hasError('email')) {
        throw EmailAlreadyExistsException();
      }
      throw AuthApiException(error.response?.statusCode ?? 0, apiError.message);
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await _api.forgotPassword(ForgotPasswordRequestModel(
        email: email.trim().toLowerCase(),
      ));
    } on DioException catch (error) {
      throw _apiException(error);
    }
  }

  @override
  Future<void> resetPassword({required String email, required String code, required String password}) async {
    try {
      await _api.resetPassword(ResetPasswordRequestModel(
        email: email.trim().toLowerCase(),
        token: code,
        password: password,
        passwordConfirmation: password,
      ));
    } on DioException catch (error) {
      if (error.response?.statusCode == 422) {
        throw InvalidResetCodeException();
      }
      throw _apiException(error);
    }
  }

  @override
  Future<AuthResponseDto?> restoreSession() async {
    final token = await _tokenStorage.readAccessToken();
    if (token == null || token.isEmpty) return null;

    try {
      final response = await _api.me();
      return AuthResponseDto(
        token: token,
        tokenType: 'Bearer',
        user: response.data.data,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
        await _tokenStorage.clearAccessToken();
        return null;
      }
      throw _apiException(error);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _api.logout();
    } on DioException catch (error) {
      if (error.response?.statusCode != 401) throw _apiException(error);
    } finally {
      await _tokenStorage.clearAccessToken();
    }
  }

  ApiErrorResponseModel _errorModel(DioException error) {
    final data = error.response?.data;
    if (data is Map) {
      return ApiErrorResponseModel.fromJson(Map<String, dynamic>.from(data));
    }
    return const ApiErrorResponseModel(message: 'Unable to communicate with the server.');
  }

  AuthApiException _apiException(DioException error) {
    final apiError = _errorModel(error);
    return AuthApiException(error.response?.statusCode ?? 0, apiError.message);
  }
}
