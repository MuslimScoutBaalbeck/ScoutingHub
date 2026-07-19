import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant_category.dart';

class ChantLibraryData {
  const ChantLibraryData({
    required this.categories,
    required this.chants,
  });

  final List<ChantCategory> categories;
  final List<Chant> chants;

  List<Chant> chantsForCategory(String categoryId) => chants
      .where((chant) => chant.categoryId == categoryId)
      .toList(growable: false);
}

class AssetChantRepository {
  const AssetChantRepository();

  static const _categoriesPath = 'assets/data/chants/categories.json';

  Future<ChantLibraryData> loadLibrary() async {
    final categoriesJson = await rootBundle.loadString(_categoriesPath);
    final decodedCategories = jsonDecode(categoriesJson) as Map<String, dynamic>;
    final rawCategories = decodedCategories['categories'] as List<dynamic>? ?? const [];

    final categories = rawCategories
        .map((value) => _parseCategory(value as Map<String, dynamic>))
        .toList(growable: false)
      ..sort((a, b) => a.order.compareTo(b.order));

    final chants = <Chant>[];
    for (final category in categories) {
      chants.addAll(await _loadCollection(category));
    }

    return ChantLibraryData(categories: categories, chants: chants);
  }

  ChantCategory _parseCategory(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>? ?? const {};

    return ChantCategory(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      nameAr: name['ar'] as String? ?? '',
      nameEn: name['en'] as String? ?? '',
      icon: json['icon'] as String? ?? 'music',
      collectionPath: json['collectionPath'] as String? ?? '',
      order: json['order'] as int? ?? 0,
    );
  }

  Future<List<Chant>> _loadCollection(ChantCategory category) async {
    if (category.collectionPath.isEmpty) {
      return const [];
    }

    final collectionJson = await rootBundle.loadString(category.collectionPath);
    final decoded = jsonDecode(collectionJson) as Map<String, dynamic>;
    final items = decoded['items'] as List<dynamic>? ?? const [];

    return items
        .map(
          (value) => _parseChant(
            categoryId: category.id,
            json: value as Map<String, dynamic>,
          ),
        )
        .where((chant) => chant.id.isNotEmpty)
        .toList(growable: false);
  }

  Chant _parseChant({
    required String categoryId,
    required Map<String, dynamic> json,
  }) {
    final title = json['title'] as Map<String, dynamic>? ?? const {};
    final lyrics = json['lyrics'] as Map<String, dynamic>? ?? const {};
    final media = json['media'] as Map<String, dynamic>?;
    final youtube = media?['youtube'] as Map<String, dynamic>?;

    return Chant(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      type: json['type'] as String? ?? 'chant',
      categoryId: categoryId,
      titleAr: title['ar'] as String? ?? '',
      titleEn: title['en'] as String? ?? '',
      lyricsAr: lyrics['ar'] as String? ?? '',
      lyricsEn: lyrics['en'] as String?,
      youtubeUrl: youtube?['enabled'] == true
          ? youtube?['url'] as String?
          : null,
    );
  }
}
