///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$app$en app = Translations$app$en.internal(_root);
  late final Translations$language$en language = Translations$language$en.internal(_root);
  late final Translations$startup$en startup = Translations$startup$en.internal(_root);
}

// Path: app
class Translations$app$en {
  Translations$app$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Scouting Hub'
  ///
  /// ar: 'Scouting Hub'
  String get name => 'Scouting Hub';

  /// en: 'Your digital scouting library'
  ///
  /// ar: 'مكتبتك الكشفية الرقمية'
  String get tagline => 'Your digital scouting library';

  /// en: 'Explore scout chants, songs, lessons, rhythms, videos, books, and more — all in one place.'
  ///
  /// ar: 'استكشف الصرخات والأناشيد والدروس والدقات والفيديوهات والكتب الكشفية وغيرها، كل ذلك في مكان واحد.'
  String get description =>
      'Explore scout chants, songs, lessons, rhythms, videos, books, and more — all in one place.';
}

// Path: language
class Translations$language$en {
  Translations$language$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Languages'
  ///
  /// ar: 'اللغات'
  String get title => 'Languages';

  /// en: 'Preparing your language...'
  ///
  /// ar: 'جاري تجهيز اللغة...'
  String get wait => 'Preparing your language...';
}

// Path: startup
class Translations$startup$en {
  Translations$startup$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Startup failed'
  ///
  /// ar: 'تعذر بدء التطبيق'
  String get failure_title => 'Startup failed';

  /// en: 'Retry'
  ///
  /// ar: 'إعادة المحاولة'
  String get retry => 'Retry';

  /// en: 'Preparing Wareed...'
  ///
  /// ar: 'جاري تجهيز وريد...'
  String get loading => 'Preparing Wareed...';
}
