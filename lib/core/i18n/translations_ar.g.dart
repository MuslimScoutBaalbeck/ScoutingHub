///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ar,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <ar>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAr _root = this; // ignore: unused_field

  @override
  TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsAr(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$app$ar app = _Translations$app$ar._(_root);
  @override
  late final _Translations$language$ar language = _Translations$language$ar._(_root);
  @override
  late final _Translations$startup$ar startup = _Translations$startup$ar._(_root);
}

// Path: app
class _Translations$app$ar extends Translations$app$en {
  _Translations$app$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Scouting Hub';
  @override
  String get tagline => 'مكتبتك الكشفية الرقمية';
  @override
  String get description =>
      'استكشف الصرخات والأناشيد والدروس والدقات والفيديوهات والكتب الكشفية وغيرها، كل ذلك في مكان واحد.';
}

// Path: language
class _Translations$language$ar extends Translations$language$en {
  _Translations$language$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اللغات';
  @override
  String get wait => 'جاري تجهيز اللغة...';
}

// Path: startup
class _Translations$startup$ar extends Translations$startup$en {
  _Translations$startup$ar._(TranslationsAr root) : this._root = root, super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get failure_title => 'تعذر بدء التطبيق';
  @override
  String get retry => 'إعادة المحاولة';
  @override
  String get loading => 'جاري تجهيز وريد...';
}
