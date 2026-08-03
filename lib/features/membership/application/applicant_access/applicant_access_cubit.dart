import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'applicant_access_cubit.freezed.dart';
part 'applicant_access_state.dart';

enum ApplicantDestination {
  verifyEmail,
  membershipRequest,
  requestStatus,
  home,
}

enum ApplicantRequestStatus {
  none,
  submitted,
  underReview,
  needsInformation,
  approved,
  rejected,
}

@singleton
final class ApplicantAccessCubit extends HydratedCubit<ApplicantAccessState> {
  ApplicantAccessCubit() : super(const ApplicantAccessState());

  void startSession({required String email}) {
    if (state.email == email) {
      return;
    }

    emit(ApplicantAccessState(email: email));
  }

  void markEmailVerified() {
    emit(state.copyWith(emailVerified: true));
  }

  void submitMembershipRequest({required String requestId}) {
    emit(
      state.copyWith(
        requestId: requestId,
        requestStatus: ApplicantRequestStatus.submitted,
      ),
    );
  }

  void updateRequestStatus(ApplicantRequestStatus status) {
    emit(state.copyWith(requestStatus: status));
  }

  void reset() => emit(const ApplicantAccessState());

  @override
  ApplicantAccessState? fromJson(Map<String, dynamic> json) {
    return ApplicantAccessState(
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      requestId: json['requestId'] as String?,
      requestStatus: ApplicantRequestStatus.values.byName(
        json['requestStatus'] as String? ?? ApplicantRequestStatus.none.name,
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(ApplicantAccessState state) => {
    'email': state.email,
    'emailVerified': state.emailVerified,
    'requestId': state.requestId,
    'requestStatus': state.requestStatus.name,
  };
}
