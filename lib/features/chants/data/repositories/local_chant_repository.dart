import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant_category.dart';
import 'package:scouting_hub/features/chants/domain/repositories/chant_repository.dart';

class LocalChantRepository implements ChantRepository {
  const LocalChantRepository();

  static const _categoriesPath = 'assets/data/chants/categories.json';

  @override
  Future<List<ChantCategory>> getCategories() async {
    final source = await rootBundle.loadString(_categoriesPath);
    final json = jsonDecode(source) as Map<String, dynamic>;
    final values = json['categories'] as List<dynamic>? ?? const [];

    final categories = values
        .cast<Map<String, dynamic>>()
        .map(_categoryFromJson)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    return categories;
  }

  @override
  Future<List<Chant>> getChants({String? categoryId}) async {
    final categories = await getCategories();
    final selected = categoryId == null
        ? categories
        : categories.where((category) => category.id == categoryId).toList();

    final chants = <Chant>[];
    for (final category in selected) {
      final source = await rootBundle.loadString(category.collectionPath);
      final json = jsonDecode(source) as Map<String, dynamic>;
      final values = json['items'] as List<dynamic>? ?? const [];

      chants.addAll(
        values
            .cast<Map<String, dynamic>>()
            .where((item) => item['status'] == 'published')
            .map((item) => _chantFromJson(item, category.id)),
      );
    }

    return chants;
  }

  ChantCategory _categoryFromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>? ?? const {};

    return ChantCategory(
      id: json['id'] as String,
      slug: json['slug'] as String,
      nameAr: name['ar'] as String? ?? '',
      nameEn: name['en'] as String? ?? '',
      icon: json['icon'] as String? ?? 'music',
      collectionPath: json['collectionPath'] as String,
      order: json['order'] as int? ?? 0,
    );
  }

  Chant _chantFromJson(Map<String, dynamic> json, String categoryId) {
    final title = json['title'] as Map<String, dynamic>? ?? const {};
    final lyrics = json['lyrics'] as Map<String, dynamic>? ?? const {};
    final media = json['media'] as Map<String, dynamic>?;
    final youtube = media?['youtube'] as Map<String, dynamic>?;

    return Chant(
      id: json['id'] as String,
      code: json['code'] as String? ?? '',
      type: json['type'] as String? ?? 'chant',
      categoryId: categoryId,
      titleAr: title['ar'] as String? ?? '',
      titleEn: title['en'] as String? ?? '',
      lyricsAr: lyrics['ar'] as String? ?? '',
      lyricsEn: lyrics['en'] as String?,
      youtubeUrl: youtube?['enabled'] == true ? youtube?['url'] as String? : null,
    );
  }
}
