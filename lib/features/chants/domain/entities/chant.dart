class Chant {
  const Chant({
    required this.id,
    required this.code,
    required this.type,
    required this.categoryId,
    required this.titleAr,
    required this.titleEn,
    required this.lyricsAr,
    this.lyricsEn,
    this.youtubeUrl,
  });

  final String id;
  final String code;
  final String type;
  final String categoryId;
  final String titleAr;
  final String titleEn;
  final String lyricsAr;
  final String? lyricsEn;
  final String? youtubeUrl;

  bool get hasYoutube => youtubeUrl?.isNotEmpty ?? false;

  String titleFor(String languageCode) =>
      languageCode == 'ar' ? titleAr : titleEn;

  String lyricsFor(String languageCode) {
    if (languageCode == 'ar') {
      return lyricsAr;
    }

    final translatedLyrics = lyricsEn;
    if (translatedLyrics == null || translatedLyrics.trim().isEmpty) {
      return lyricsAr;
    }

    return translatedLyrics;
  }
}
