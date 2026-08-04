import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';

@lazySingleton
final class FakeMembershipRequestsDataSource {
  List<MembershipRequest>? _cache;

  Future<List<MembershipRequest>> load() async {
    if (_cache case final cached?) {
      return List.unmodifiable(cached);
    }

    final source = await rootBundle.loadString(
      'assets/data/people/membership_requests.json',
    );
    final decoded = jsonDecode(source) as Map<String, dynamic>;
    final records = decoded['requests'] as List<dynamic>? ?? const [];
    final requests = records
        .map((record) {
          final json = record as Map<String, dynamic>;
          return MembershipRequest(
            id: json['id'] as String,
            fullName: json['fullName'] as String,
            phone: json['phone'] as String,
            email: json['email'] as String? ?? '',
            address: json['address'] as String? ?? '',
            stage: json['stage'] as String,
            notes: json['notes'] as String? ?? '',
            status: MembershipRequestStatus.values.byName(
              json['status'] as String,
            ),
            submittedAt: DateTime.parse(json['submittedAt'] as String),
          );
        })
        .toList(growable: true);

    _cache = requests;
    return List.unmodifiable(requests);
  }

  Future<MembershipRequest> save(MembershipRequest request) async {
    final requests = List<MembershipRequest>.of(await load());
    final index = requests.indexWhere((item) => item.id == request.id);
    if (index == -1) {
      requests.insert(0, request);
    } else {
      requests[index] = request;
    }
    _cache = requests;
    return request;
  }
}
