class ChantUiText {
  const ChantUiText._();

  static bool isArabic(String languageCode) => languageCode == 'ar';

  static String library(String languageCode) =>
      isArabic(languageCode) ? 'مكتبة الأناشيد' : 'Chant Library';

  static String categories(String languageCode) =>
      isArabic(languageCode) ? 'التصنيفات' : 'Categories';

  static String recent(String languageCode) =>
      isArabic(languageCode) ? 'أحدث الإضافات' : 'Latest additions';

  static String seeAll(String languageCode) =>
      isArabic(languageCode) ? 'عرض الكل' : 'See all';

  static String searchHint(String languageCode) => isArabic(languageCode)
      ? 'ابحث عن نشيد أو صرخة'
      : 'Search chants and songs';

  static String noItems(String languageCode) => isArabic(languageCode)
      ? 'لا يوجد محتوى في هذا القسم حالياً.'
      : 'No content is available in this section yet.';

  static String lyrics(String languageCode) =>
      isArabic(languageCode) ? 'الكلمات' : 'Lyrics';

  static String youtube(String languageCode) =>
      isArabic(languageCode) ? 'مشاهدة على يوتيوب' : 'Watch on YouTube';

  static String retry(String languageCode) =>
      isArabic(languageCode) ? 'إعادة المحاولة' : 'Retry';

  static String loadFailure(String languageCode) => isArabic(languageCode)
      ? 'تعذر تحميل مكتبة الأناشيد.'
      : 'The chant library could not be loaded.';
}
