import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/features/chants/application/chant_catalog_state.dart';
import 'package:scouting_hub/features/chants/domain/repositories/chant_repository.dart';

class ChantCatalogCubit extends Cubit<ChantCatalogState> {
  ChantCatalogCubit(this._repository) : super(const ChantCatalogState());

  final ChantRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: ChantCatalogStatus.loading, clearError: true));

    try {
      final categories = await _repository.getCategories();
      final chants = await _repository.getChants();
      emit(
        state.copyWith(
          status: ChantCatalogStatus.success,
          categories: categories,
          chants: chants,
        ),
      );
    } on Object catch (error) {
      emit(
        state.copyWith(
          status: ChantCatalogStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> selectCategory(String? categoryId) async {
    emit(
      state.copyWith(
        status: ChantCatalogStatus.loading,
        selectedCategoryId: categoryId,
        clearSelectedCategory: categoryId == null,
        clearError: true,
      ),
    );

    try {
      final chants = await _repository.getChants(categoryId: categoryId);
      emit(
        state.copyWith(
          status: ChantCatalogStatus.success,
          chants: chants,
          selectedCategoryId: categoryId,
          clearSelectedCategory: categoryId == null,
        ),
      );
    } on Object catch (error) {
      emit(
        state.copyWith(
          status: ChantCatalogStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void search(String value) => emit(state.copyWith(query: value));
}
