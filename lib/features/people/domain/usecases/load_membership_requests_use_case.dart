import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';
import 'package:scouting_hub/features/people/domain/repositories/membership_requests_repository.dart';

@injectable
final class LoadMembershipRequestsUseCase {
  const LoadMembershipRequestsUseCase(this.repository);

  final MembershipRequestsRepository repository;

  Future<List<MembershipRequest>> call() {
    return repository.load();
  }
}
