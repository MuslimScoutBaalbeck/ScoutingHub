import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/services/auth_api_service.dart';

@lazySingleton
final class EmailVerificationService {
  const EmailVerificationService(this._api);

  final AuthApiService _api;

  Future<bool> isVerified() async {
    final response = await _api.verificationStatus();
    return response.data.data.verified;
  }

  Future<void> resend() async {
    await _api.resendVerification();
  }
}
