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
  Future<Map<String, dynamic>> login(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/register')
  Future<Map<String, dynamic>> register(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/forgot-password')
  Future<void> forgotPassword(
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/reset-password')
  Future<void> resetPassword(
    @Body() Map<String, dynamic> body,
  );

  @GET('/auth/me')
  Future<Map<String, dynamic>> me();

  @POST('/auth/logout')
  Future<void> logout();
}
