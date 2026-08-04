import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/services/auth_api_service.dart';

@lazySingleton
final class EmailVerificationService {
  const EmailVerificationService(this._api);

  final AuthApiService _api;

  Future<bool> isVerified() async {
    final response = await _api.verificationStatus();
    final body = response.data;
    final data = body['data'];
    final payload = data is Map<String, dynamic> ? data : body;

    return payload['verified'] as bool? ?? false;
  }

  Future<void> resend() async {
    await _api.resendVerification();
  }
}
