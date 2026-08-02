import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';

final class FakeInvalidCredentialsException implements Exception {}
final class FakeEmailAlreadyExistsException implements Exception {}
final class FakeUnauthenticatedException implements Exception {}

@Injectable(as:AuthRemoteDataSource )
final class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  FakeAuthRemoteDataSource({
    this.delay = const Duration(milliseconds: 700),
  });

  final Duration delay;
  AuthResponseDto? _activeSession;

  static const _demoEmail = 'demo@example.com';
  static const _demoPassword = 'password';

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(delay);

    if (email != _demoEmail || password != _demoPassword) {
      throw FakeInvalidCredentialsException();
    }

    _activeSession = AuthResponseDto.fromJson({
      'token': 'fake-sanctum-token-1',
      'token_type': 'Bearer',
      'user': {
        'id': 1,
        'name': 'Demo User',
        'email': _demoEmail,
      },
    });

    return _activeSession!;
  }

  @override
  Future<AuthResponseDto> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(delay);

    if (email == _demoEmail) {
      throw FakeEmailAlreadyExistsException();
    }

    _activeSession = AuthResponseDto.fromJson({
      'token': 'fake-sanctum-token-${DateTime.now().millisecondsSinceEpoch}',
      'token_type': 'Bearer',
      'user': {
        'id': 2,
        'name': name,
        'email': email,
      },
    });

    return _activeSession!;
  }

  @override
  Future<AuthResponseDto?> restoreSession() async {
    await Future<void>.delayed(delay ~/ 2);
    return _activeSession;
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(delay ~/ 2);
    _activeSession = null;
  }
}
