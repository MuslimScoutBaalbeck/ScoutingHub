import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/load_people_use_case.dart';

part 'members_dashboard_cubit.freezed.dart';
part 'members_dashboard_state.dart';

@injectable
final class MembersDashboardCubit extends Cubit<MembersDashboardState> {
  MembersDashboardCubit(this._loadPeopleUseCase)
    : super(const MembersDashboardState());

  final LoadPeopleUseCase _loadPeopleUseCase;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final members = await _loadPeopleUseCase();
      final activeCount = members
          .where((member) => member.status == PersonStatus.active)
          .length;
      final pendingCount = members
          .where((member) => member.status == PersonStatus.pending)
          .length;
      final incompleteCount = members
          .where((member) => !member.profileComplete)
          .length;

      emit(
        state.copyWith(
          isLoading: false,
          members: members,
          totalCount: members.length,
          activeCount: activeCount,
          pendingCount: pendingCount,
          incompleteCount: incompleteCount,
          recentMembers: members.take(4).toList(growable: false),
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          isLoading: false,
          error: MembersDashboardError.unexpected,
        ),
      );
    }
  }
}
