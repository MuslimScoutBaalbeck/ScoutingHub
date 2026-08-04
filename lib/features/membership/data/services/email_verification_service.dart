import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/services/auth_api_service.dart';

@lazySingleton
final class EmailVerificationService {
  const EmailVerificationService(this._api);

  final AuthApiService _api;

  Future<bool> isVerified() async {
    final response = await _api.verificationStatus();
    final body = _asJsonMap(response.data);
    final data = body['data'];
    final payload = data is Map
        ? Map<String, Object?>.from(data)
        : body;

    return payload['verified'] as bool? ?? false;
  }

  Future<void> resend() async {
    await _api.resendVerification();
  }

  Map<String, Object?> _asJsonMap(Object? value) {
    if (value is Map<String, Object?>) {
      return value;
    }

    if (value is Map) {
      return Map<String, Object?>.from(value);
    }

    return const <String, Object?>{};
  }
}
