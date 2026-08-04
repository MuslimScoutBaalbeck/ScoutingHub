import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:scouting_hub/features/auth/data/models/auth_api_models.dart';

part 'auth_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth/login')
  Future<HttpResponse<AuthSessionResponseModel>> login(
    @Body() LoginRequestModel body,
  );

  @POST('/auth/register')
  Future<HttpResponse<AuthSessionResponseModel>> register(
    @Body() RegisterRequestModel body,
  );

  @POST('/auth/forgot-password')
  Future<HttpResponse<MessageResponseModel>> forgotPassword(
    @Body() ForgotPasswordRequestModel body,
  );

  @POST('/auth/reset-password')
  Future<HttpResponse<MessageResponseModel>> resetPassword(
    @Body() ResetPasswordRequestModel body,
  );

  @GET('/auth/me')
  Future<HttpResponse<AuthUserResponseModel>> me();

  @POST('/auth/logout')
  Future<HttpResponse<MessageResponseModel>> logout();

  @GET('/auth/email/verification-status')
  Future<HttpResponse<VerificationResponseModel>> verificationStatus();

  @POST('/auth/email/verification-notification')
  Future<HttpResponse<VerificationResponseModel>> resendVerification();
}
