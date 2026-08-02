import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';

final class FakeInvalidCredentialsException implements Exception {}
final class FakeEmailAlreadyExistsException implements Exception {}
final class FakeUnauthenticatedException implements Exception {}
final class FakeInvalidResetCodeException implements Exception {}

@LazySingleton(as: AuthRemoteDataSource)
final class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  static const _delay = Duration(milliseconds: 700);

  AuthResponseDto? _activeSession;
  Map<String, dynamic>? _fixture;

  Future<Map<String, dynamic>> _loadFixture() async {
    if (_fixture != null) {
      return _fixture!;
    }

    final json = await rootBundle.loadString('assets/data/auth/auth.json');
    _fixture = jsonDecode(json) as Map<String, dynamic>;
    return _fixture!;
  }

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(_delay);
    final fixture = await _loadFixture();
    final user = fixture['user'] as Map<String, dynamic>;

    if (email.trim().toLowerCase() != user['email'] ||
        password != fixture['password']) {
      throw FakeInvalidCredentialsException();
    }

    _activeSession = AuthResponseDto.fromJson({
      'token': fixture['token'],
      'token_type': 'Bearer',
      'user': user,
    });

    return _activeSession!;
  }

  @override
  Future<AuthResponseDto> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(_delay);
    final fixture = await _loadFixture();
    final user = fixture['user'] as Map<String, dynamic>;

    if (email.trim().toLowerCase() == user['email']) {
      throw FakeEmailAlreadyExistsException();
    }

    _activeSession = AuthResponseDto.fromJson({
      'token': 'fake-sanctum-token-${DateTime.now().millisecondsSinceEpoch}',
      'token_type': 'Bearer',
      'user': {
        'id': 2,
        'name': name.trim(),
        'email': email.trim().toLowerCase(),
      },
    });

    return _activeSession!;
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await Future<void>.delayed(_delay);
    if (email.trim().isEmpty) {
      throw FakeUnauthenticatedException();
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    await Future<void>.delayed(_delay);
    final fixture = await _loadFixture();
    if (code != fixture['reset_code']) {
      throw FakeInvalidResetCodeException();
    }
  }

  @override
  Future<AuthResponseDto?> restoreSession() async {
    await Future<void>.delayed(_delay ~/ 2);
    return _activeSession;
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(_delay ~/ 2);
    _activeSession = null;
  }
}
