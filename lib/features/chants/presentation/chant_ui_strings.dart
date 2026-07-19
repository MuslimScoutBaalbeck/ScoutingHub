class ChantUiStrings {
  const ChantUiStrings(this.languageCode);

  final String languageCode;

  bool get isArabic => languageCode == 'ar';

  String get appName => 'Scouting Hub';
  String get library => isArabic ? 'مكتبة الأناشيد' : 'Chant Library';
  String get explore => isArabic
      ? 'استكشف الأناشيد والصرخات الكشفية واقرأ كلماتها.'
      : 'Explore scout songs and chants and read their lyrics.';
  String get categories => isArabic ? 'التصنيفات' : 'Categories';
  String get latest => isArabic ? 'الأناشيد المتوفرة' : 'Available chants';
  String get all => isArabic ? 'الكل' : 'All';
  String get searchHint => isArabic ? 'ابحث عن نشيد أو صرخة' : 'Search chants and songs';
  String get lyrics => isArabic ? 'الكلمات' : 'Lyrics';
  String get youtube => isArabic ? 'مشاهدة على YouTube' : 'Watch on YouTube';
  String get retry => isArabic ? 'إعادة المحاولة' : 'Retry';
  String get loadFailed => isArabic ? 'تعذر تحميل المكتبة' : 'Could not load the library';
  String get empty => isArabic ? 'لا توجد نتائج حالياً' : 'No results found';
  String get openLibrary => isArabic ? 'فتح المكتبة' : 'Open library';
  String get noVideo => isArabic ? 'لا يوجد فيديو متاح' : 'No video is available';
}
