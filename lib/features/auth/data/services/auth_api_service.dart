import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth/login')
  Future<HttpResponse<Object?>> login(
    @Body() Map<String, Object?> body,
  );

  @POST('/auth/register')
  Future<HttpResponse<Object?>> register(
    @Body() Map<String, Object?> body,
  );

  @POST('/auth/forgot-password')
  Future<HttpResponse<Object?>> forgotPassword(
    @Body() Map<String, Object?> body,
  );

  @POST('/auth/reset-password')
  Future<HttpResponse<Object?>> resetPassword(
    @Body() Map<String, Object?> body,
  );

  @GET('/auth/me')
  Future<HttpResponse<Object?>> me();

  @POST('/auth/logout')
  Future<HttpResponse<Object?>> logout();

  @GET('/auth/email/verification-status')
  Future<HttpResponse<Object?>> verificationStatus();

  @POST('/auth/email/verification-notification')
  Future<HttpResponse<Object?>> resendVerification();
}
