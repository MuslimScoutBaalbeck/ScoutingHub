class ChantCategory {
  const ChantCategory({
    required this.id,
    required this.slug,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.collectionPath,
    required this.order,
  });

  final String id;
  final String slug;
  final String nameAr;
  final String nameEn;
  final String icon;
  final String collectionPath;
  final int order;

  String nameFor(String languageCode) =>
      languageCode == 'ar' ? nameAr : nameEn;
}
