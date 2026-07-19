import 'package:equatable/equatable.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant_category.dart';

enum ChantCatalogStatus { initial, loading, success, failure }

class ChantCatalogState extends Equatable {
  const ChantCatalogState({
    this.status = ChantCatalogStatus.initial,
    this.categories = const [],
    this.chants = const [],
    this.selectedCategoryId,
    this.query = '',
    this.errorMessage,
  });

  final ChantCatalogStatus status;
  final List<ChantCategory> categories;
  final List<Chant> chants;
  final String? selectedCategoryId;
  final String query;
  final String? errorMessage;

  List<Chant> filteredChants(String languageCode) {
    final normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return chants;
    }

    return chants.where((chant) {
      return chant.titleFor(languageCode).toLowerCase().contains(normalizedQuery) ||
          chant.lyricsFor(languageCode).toLowerCase().contains(normalizedQuery);
    }).toList();
  }

  ChantCatalogState copyWith({
    ChantCatalogStatus? status,
    List<ChantCategory>? categories,
    List<Chant>? chants,
    String? selectedCategoryId,
    bool clearSelectedCategory = false,
    String? query,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ChantCatalogState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      chants: chants ?? this.chants,
      selectedCategoryId: clearSelectedCategory
          ? null
          : selectedCategoryId ?? this.selectedCategoryId,
      query: query ?? this.query,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        chants,
        selectedCategoryId,
        query,
        errorMessage,
      ];
}
