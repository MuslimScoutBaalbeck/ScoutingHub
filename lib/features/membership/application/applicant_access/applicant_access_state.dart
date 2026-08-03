part of 'applicant_access_cubit.dart';

@freezed
abstract class ApplicantAccessState with _$ApplicantAccessState {
  const factory ApplicantAccessState({
    String? email,
    @Default(false) bool emailVerified,
    String? requestId,
    @Default(ApplicantRequestStatus.none)
    ApplicantRequestStatus requestStatus,
  }) = _ApplicantAccessState;

  const ApplicantAccessState._();

  ApplicantDestination get destination {
    if (!emailVerified) {
      return ApplicantDestination.verifyEmail;
    }

    if (requestStatus == ApplicantRequestStatus.none ||
        requestStatus == ApplicantRequestStatus.rejected) {
      return ApplicantDestination.membershipRequest;
    }

    if (requestStatus == ApplicantRequestStatus.approved) {
      return ApplicantDestination.home;
    }

    return ApplicantDestination.requestStatus;
  }
}
