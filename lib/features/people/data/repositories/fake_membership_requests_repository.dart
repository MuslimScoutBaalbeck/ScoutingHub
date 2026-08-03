import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/data/datasources/fake_membership_requests_data_source.dart';
import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';
import 'package:scouting_hub/features/people/domain/repositories/membership_requests_repository.dart';

@LazySingleton(as: MembershipRequestsRepository)
final class FakeMembershipRequestsRepository
    implements MembershipRequestsRepository {
  FakeMembershipRequestsRepository(this._dataSource);

  final FakeMembershipRequestsDataSource _dataSource;

  @override
  Future<List<MembershipRequest>> load() => _dataSource.load();

  @override
  Future<MembershipRequest> save(MembershipRequest request) =>
      _dataSource.save(request);
}
