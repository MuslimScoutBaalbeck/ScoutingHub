import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:scouting_hub/features/membership/data/models/membership_location_models.dart';

part 'membership_onboarding_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class MembershipOnboardingApiService {
  @factoryMethod
  factory MembershipOnboardingApiService(Dio dio) =
      _MembershipOnboardingApiService;

  @GET('/membership-onboarding/bootstrap')
  Future<HttpResponse<MembershipBootstrapResponseModel>> bootstrap();
}
