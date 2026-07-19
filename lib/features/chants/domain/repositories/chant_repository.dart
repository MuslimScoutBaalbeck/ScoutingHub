import 'package:scouting_hub/features/chants/domain/entities/chant.dart';
import 'package:scouting_hub/features/chants/domain/entities/chant_category.dart';

abstract interface class ChantRepository {
  Future<List<ChantCategory>> getCategories();

  Future<List<Chant>> getChants({String? categoryId});
}
