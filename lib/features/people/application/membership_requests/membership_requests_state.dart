part of 'membership_requests_cubit.dart';

enum MembershipRequestsError { unexpected }

@freezed
abstract class MembershipRequestsState with _$MembershipRequestsState {
  const factory MembershipRequestsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(<MembershipRequest>[]) List<MembershipRequest> requests,
    MembershipRequestStatus? statusFilter,
    MembershipRequestsError? error,
  }) = _MembershipRequestsState;

  const MembershipRequestsState._();

  List<MembershipRequest> get visibleRequests {
    final filter = statusFilter;
    if (filter == null) return requests;
    return requests
        .where((request) => request.status == filter)
        .toList(growable: false);
  }
}
