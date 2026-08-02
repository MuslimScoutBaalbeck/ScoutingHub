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
class TranslationsAr extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsAr({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ar,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(
         cardinalResolver: cardinalResolver,
         ordinalResolver: ordinalResolver,
       );

  /// Metadata for the translations of <ar>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsAr _root = this; // ignore: unused_field

  @override
  TranslationsAr $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => TranslationsAr(meta: meta ?? this.$meta);

  // Translations
  @override
  late final _Translations$app$ar app = _Translations$app$ar._(_root);
  @override
  late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
  @override
  late final _Translations$language$ar language = _Translations$language$ar._(
    _root,
  );
  @override
  late final _Translations$startup$ar startup = _Translations$startup$ar._(
    _root,
  );
}

// Path: app
class _Translations$app$ar extends Translations$app$en {
  _Translations$app$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'الكشاف المسلم';
  @override
  String get tagline => 'إدارة فوجك وكل ما تحتاجه في مغامرتك الكشفية';
  @override
  String get description =>
      'تطبيق متكامل لإدارة الأفواج والأعضاء والأنشطة والمهام والأناشيد، وكل ما تحتاجه طوال رحلتك الكشفية.';
}

// Path: auth
class _Translations$auth$ar extends Translations$auth$en {
  _Translations$auth$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$auth$forgot_password$ar forgot_password =
      _Translations$auth$forgot_password$ar._(_root);
  @override
  late final _Translations$auth$login$ar login = _Translations$auth$login$ar._(
    _root,
  );
  @override
  late final _Translations$auth$register$ar register =
      _Translations$auth$register$ar._(_root);
  @override
  late final _Translations$auth$reset_password$ar reset_password =
      _Translations$auth$reset_password$ar._(_root);
  @override
  late final _Translations$auth$welcome$ar welcome =
      _Translations$auth$welcome$ar._(_root);
}

// Path: language
class _Translations$language$ar extends Translations$language$en {
  _Translations$language$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'اللغات';
  @override
  String get wait => 'جاري تجهيز اللغة...';
}

// Path: startup
class _Translations$startup$ar extends Translations$startup$en {
  _Translations$startup$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get failure_title => 'تعذر بدء التطبيق';
  @override
  String get retry => 'إعادة المحاولة';
  @override
  String get organization => 'جمعية الكشاف المسلم في لبنان';
  @override
  String get loading => 'جاري تجهيز المنصة الكشفية...';
  @override
  String get please_wait => 'يرجى الانتظار ريثما نجهّز تجربتك الكشفية';
}

// Path: auth.forgot_password
class _Translations$auth$forgot_password$ar
    extends Translations$auth$forgot_password$en {
  _Translations$auth$forgot_password$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'نسيت كلمة المرور';
  @override
  String get subtitle => 'أدخل بريدك الإلكتروني وسنرسل رمز إعادة تعيين تجريبي.';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get submit => 'إرسال رمز إعادة التعيين';
  @override
  String get back_to_login => 'العودة إلى تسجيل الدخول';
  @override
  String get success => 'تم إرسال الرمز. استخدم 123456 في النسخة التجريبية.';
  @override
  String get required_email => 'أدخل بريدك الإلكتروني.';
}

// Path: auth.login
class _Translations$auth$login$ar extends Translations$auth$login$en {
  _Translations$auth$login$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'مرحباً بك في\nمنصة الكشاف المسلم';
  @override
  String get subtitle => 'سجّل الدخول لمتابعة مغامرتك';
  @override
  String get adventure_prefix => 'ابدأ';
  @override
  late final _Translations$auth$login$adventure_words$ar adventure_words =
      _Translations$auth$login$adventure_words$ar._(_root);
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get password => 'كلمة المرور';
  @override
  String get forgot_password => 'نسيت كلمة المرور؟';
  @override
  String get submit => 'تسجيل الدخول';
  @override
  String get no_account => 'ليس لديك حساب؟';
  @override
  String get register => 'إنشاء حساب';
  @override
  String get or => 'أو';
  @override
  String get google => 'Google';
  @override
  String get apple => 'Apple';
  @override
  String get coming_soon => 'قريباً';
  @override
  String get switch_language => 'تبديل اللغة';
  @override
  String get switch_theme => 'تبديل المظهر';
  @override
  String get show_password => 'إظهار كلمة المرور';
  @override
  String get hide_password => 'إخفاء كلمة المرور';
  @override
  String get demo_credentials => 'للتجربة: demo@example.com / password';
  @override
  String get invalid_credentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
  @override
  String get required_fields => 'البريد الإلكتروني وكلمة المرور مطلوبان.';
}

// Path: auth.register
class _Translations$auth$register$ar extends Translations$auth$register$en {
  _Translations$auth$register$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إنشاء حساب جديد';
  @override
  String get subtitle =>
      'انضم إلى منصة الكشاف واحتفظ بمواردك الكشفية في مكان واحد.';
  @override
  String get name => 'الاسم الكامل';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get password => 'كلمة المرور';
  @override
  String get password_confirmation => 'تأكيد كلمة المرور';
  @override
  String get submit => 'إنشاء الحساب';
  @override
  String get have_account => 'لديك حساب بالفعل؟';
  @override
  String get login => 'تسجيل الدخول';
  @override
  String get password_hint => 'استخدم 8 أحرف على الأقل.';
  @override
  String get password_mismatch => 'تأكيد كلمة المرور غير متطابق.';
  @override
  String get validation_error => 'أكمل جميع الحقول بشكل صحيح.';
}

// Path: auth.reset_password
class _Translations$auth$reset_password$ar
    extends Translations$auth$reset_password$en {
  _Translations$auth$reset_password$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'إعادة تعيين كلمة المرور';
  @override
  String get subtitle =>
      'أدخل رمز إعادة التعيين التجريبي واختر كلمة مرور جديدة.';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get code => 'رمز إعادة التعيين';
  @override
  String get password => 'كلمة المرور الجديدة';
  @override
  String get password_confirmation => 'تأكيد كلمة المرور الجديدة';
  @override
  String get submit => 'إعادة تعيين كلمة المرور';
  @override
  String get success => 'تمت إعادة تعيين كلمة المرور. يمكنك تسجيل الدخول الآن.';
  @override
  String get invalid_code =>
      'رمز إعادة التعيين غير صحيح. استخدم 123456 للتجربة.';
  @override
  String get validation_error => 'أكمل جميع الحقول بشكل صحيح.';
}

// Path: auth.welcome
class _Translations$auth$welcome$ar extends Translations$auth$welcome$en {
  _Translations$auth$welcome$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'أهلاً بك في تطبيق الكشاف المسلم';
  @override
  String get subtitle =>
      'اكتشف الأناشيد والأنشطة والموارد التعليمية والأدوات الكشفية في مكان واحد.';
  @override
  String get login => 'تسجيل الدخول';
  @override
  String get register => 'إنشاء حساب';
  @override
  String get continue_as_guest => 'الاستكشاف كزائر';
}

// Path: auth.login.adventure_words
class _Translations$auth$login$adventure_words$ar
    extends Translations$auth$login$adventure_words$en {
  _Translations$auth$login$adventure_words$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get adventure => 'مغامرتك';
  @override
  String get explore => 'الاستكشاف';
  @override
  String get manage => 'الإدارة';
  @override
  String get lead => 'القيادة';
  @override
  String get more => 'والمزيد';
}
