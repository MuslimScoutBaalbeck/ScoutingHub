import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';

abstract interface class MembershipRequestsRepository {
  Future<List<MembershipRequest>> load();
  Future<MembershipRequest> save(MembershipRequest request);
}
