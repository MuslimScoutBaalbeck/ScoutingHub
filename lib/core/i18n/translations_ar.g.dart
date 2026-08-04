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
  late final _Translations$home$ar home = _Translations$home$ar._(_root);
  @override
  late final _Translations$language$ar language = _Translations$language$ar._(
    _root,
  );
  @override
  late final _Translations$membership$ar membership =
      _Translations$membership$ar._(_root);
  @override
  late final _Translations$people$ar people = _Translations$people$ar._(_root);
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
  late final _Translations$auth$errors$ar errors =
      _Translations$auth$errors$ar._(_root);
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

// Path: home
class _Translations$home$ar extends Translations$home$en {
  _Translations$home$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$home$navigation$ar navigation =
      _Translations$home$navigation$ar._(_root);
  @override
  late final _Translations$home$dashboard$ar dashboard =
      _Translations$home$dashboard$ar._(_root);
  @override
  late final _Translations$home$tasks$ar tasks = _Translations$home$tasks$ar._(
    _root,
  );
  @override
  late final _Translations$home$calendar$ar calendar =
      _Translations$home$calendar$ar._(_root);
  @override
  late final _Translations$home$more$ar more = _Translations$home$more$ar._(
    _root,
  );
  @override
  late final _Translations$home$create$ar create =
      _Translations$home$create$ar._(_root);
  @override
  late final _Translations$home$common$ar common =
      _Translations$home$common$ar._(_root);
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

// Path: membership
class _Translations$membership$ar extends Translations$membership$en {
  _Translations$membership$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$membership$verify_email$ar verify_email =
      _Translations$membership$verify_email$ar._(_root);
  @override
  late final _Translations$membership$request$ar request =
      _Translations$membership$request$ar._(_root);
  @override
  late final _Translations$membership$status$ar status =
      _Translations$membership$status$ar._(_root);
}

// Path: people
class _Translations$people$ar extends Translations$people$en {
  _Translations$people$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'الأعضاء';
  @override
  String get subtitle => 'إدارة أعضاء الفوج وسجلات الانتساب';
  @override
  String get dashboard => 'إدارة الأعضاء';
  @override
  String get dashboard_subtitle => 'العضوية والطلبات والسجلات والتقارير';
  @override
  String get search => 'البحث عن عضو';
  @override
  String get filter => 'تصفية';
  @override
  String get filters => 'فلاتر الأعضاء';
  @override
  String get apply_filters => 'تطبيق الفلاتر';
  @override
  String get clear_filters => 'إزالة جميع الفلاتر';
  @override
  String get all_stages => 'جميع المراحل';
  @override
  String get all_statuses => 'جميع الحالات';
  @override
  String get add => 'إضافة عضو';
  @override
  String get edit => 'تعديل العضو';
  @override
  String get details => 'تفاصيل العضو';
  @override
  String get save => 'حفظ العضو';
  @override
  String get next => 'التالي';
  @override
  String get back => 'السابق';
  @override
  String get finish => 'إنهاء';
  @override
  String get active => 'فاعل';
  @override
  String get pending => 'قيد المراجعة';
  @override
  String get inactive => 'غير فاعل';
  @override
  String get archived => 'مؤرشف';
  @override
  String get complete => 'الملف مكتمل';
  @override
  String get incomplete => 'الملف غير مكتمل';
  @override
  String get empty => 'لا يوجد أعضاء مطابقون للبحث أو الفلاتر.';
  @override
  String get unexpected_error => 'تعذر تحميل الأعضاء. حاول مجدداً.';
  @override
  String get retry => 'إعادة المحاولة';
  @override
  String get membership_number => 'رقم العضوية';
  @override
  String members_count({required Object count}) => '${count} أعضاء';
  @override
  String get total_members => 'إجمالي الأعضاء';
  @override
  String get active_members => 'الأعضاء الفاعلون';
  @override
  String get pending_requests => 'طلبات قيد المراجعة';
  @override
  String get incomplete_profiles => 'ملفات غير مكتملة';
  @override
  String get members_list => 'قائمة الأعضاء';
  @override
  String get membership_requests => 'طلبات الانتساب';
  @override
  String get request_subtitle =>
      'مراجعة ومعالجة طلبات الانتساب الجديدة إلى الفوج';
  @override
  String get new_request => 'طلب انتساب جديد';
  @override
  String get request_details => 'تفاصيل الطلب';
  @override
  String get request_id => 'رقم الطلب';
  @override
  String get submitted_at => 'تاريخ التقديم';
  @override
  String get request_saved => 'تم حفظ طلب الانتساب بنجاح.';
  @override
  String get request_updated => 'تم تحديث حالة الطلب بنجاح.';
  @override
  String get request_empty => 'لا توجد طلبات انتساب مطابقة لهذا الفلتر.';
  @override
  String get request_all => 'جميع الطلبات';
  @override
  String get request_new => 'مقدّم';
  @override
  String get request_review => 'قيد التدقيق';
  @override
  String get request_needs_info => 'يحتاج معلومات';
  @override
  String get request_approved => 'مقبول';
  @override
  String get request_rejected => 'مرفوض';
  @override
  String get start_review => 'بدء التدقيق';
  @override
  String get request_information => 'طلب معلومات إضافية';
  @override
  String get approve => 'قبول';
  @override
  String get reject => 'رفض';
  @override
  String get create_request => 'إنشاء الطلب';
  @override
  String get reports => 'التقارير';
  @override
  String get recent_members => 'أحدث الأعضاء';
  @override
  String get personal_information => 'المعلومات الشخصية';
  @override
  String get scout_information => 'المعلومات الكشفية';
  @override
  String get contact_information => 'معلومات الاتصال';
  @override
  String get review => 'المراجعة';
  @override
  String get full_name => 'الاسم الكامل';
  @override
  String get phone => 'رقم الهاتف';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get address => 'العنوان';
  @override
  String get emergency_contact => 'جهة اتصال للطوارئ';
  @override
  String get unit => 'الوحدة';
  @override
  String get stage => 'المرحلة';
  @override
  String get status => 'الحالة';
  @override
  String get joined_at => 'تاريخ الانتساب';
  @override
  String get notes => 'ملاحظات';
  @override
  String get report_by_stage => 'الأعضاء حسب المرحلة';
  @override
  String get report_incomplete => 'الملفات غير المكتملة';
  @override
  String get report_new_members => 'الأعضاء الجدد';
  @override
  String get report_contacts => 'دليل التواصل';
  @override
  String get export => 'تصدير';
  @override
  String get saved => 'تم حفظ العضو بنجاح.';
  @override
  late final _Translations$people$stages$ar stages =
      _Translations$people$stages$ar._(_root);
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

// Path: auth.errors
class _Translations$auth$errors$ar extends Translations$auth$errors$en {
  _Translations$auth$errors$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get email_required => 'البريد الإلكتروني مطلوب.';
  @override
  String get email_password_required =>
      'البريد الإلكتروني وكلمة المرور مطلوبان.';
  @override
  String get registration_fields_invalid =>
      'أدخل الاسم والبريد الإلكتروني بشكل صحيح، واستخدم كلمة مرور من 8 أحرف على الأقل.';
  @override
  String get password_mismatch => 'تأكيد كلمة المرور غير مطابق.';
  @override
  String get reset_fields_invalid =>
      'أكمل جميع الحقول بشكل صحيح، واستخدم كلمة مرور من 8 أحرف على الأقل.';
  @override
  String get invalid_credentials =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
  @override
  String get email_already_exists =>
      'يوجد حساب مسجل مسبقاً بهذا البريد الإلكتروني.';
  @override
  String get invalid_reset_code => 'رمز إعادة تعيين كلمة المرور غير صحيح.';
  @override
  String get unauthenticated => 'لا توجد جلسة مستخدم مسجلة.';
  @override
  String get unexpected => 'حدث خطأ غير متوقع. حاول مرة أخرى.';
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
  String get subtitle => 'أدِر فوجك وكل ما تحتاجه في مغامرتك الكشفية.';
  @override
  String get get_started => 'ابدأ الآن';
  @override
  String get preferences => 'الإعدادات الأولية';
  @override
  String get language => 'اللغة';
  @override
  String get english => 'الإنجليزية';
  @override
  String get arabic => 'العربية';
  @override
  String get appearance => 'المظهر';
  @override
  String get theme_system => 'حسب النظام';
  @override
  String get theme_light => 'فاتح';
  @override
  String get theme_dark => 'داكن';
  @override
  String get login => 'تسجيل الدخول';
  @override
  String get register => 'إنشاء حساب';
  @override
  String get continue_as_guest => 'الاستكشاف كزائر';
}

// Path: home.navigation
class _Translations$home$navigation$ar extends Translations$home$navigation$en {
  _Translations$home$navigation$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get dashboard => 'الرئيسية';
  @override
  String get tasks => 'المهام';
  @override
  String get calendar => 'التقويم';
  @override
  String get more => 'المزيد';
}

// Path: home.dashboard
class _Translations$home$dashboard$ar extends Translations$home$dashboard$en {
  _Translations$home$dashboard$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get welcome_back => 'مرحباً بعودتك';
  @override
  String get user_name => 'الكشاف التجريبي';
  @override
  String get notifications => 'الإشعارات';
  @override
  String get upcoming_title => 'نشاط قادم';
  @override
  String get upcoming_name => 'الاجتماع الأسبوعي للفوج';
  @override
  String get upcoming_details => 'غداً الساعة 5:00 مساءً · مقر الفوج';
  @override
  String get quick_access => 'وصول سريع';
  @override
  String get events => 'الأنشطة';
  @override
  String get tasks => 'المهام';
  @override
  String get teams => 'الفرق';
  @override
  String get members => 'الأعضاء';
  @override
  String get chants => 'الأناشيد';
  @override
  String get games => 'الألعاب';
  @override
  String get inventory => 'المخزون';
  @override
  String get assignments => 'مسؤولياتك';
  @override
  String get active_assignment => 'المسؤولية الحالية';
  @override
  String get no_assignment => 'لا توجد مسؤولية مسندة إليك';
  @override
  String get no_access => 'لا توجد وحدات وصول سريع متاحة ضمن صلاحياتك الحالية.';
  @override
  String get no_modules => 'لا توجد وحدات متاحة ضمن صلاحياتك الحالية.';
}

// Path: home.tasks
class _Translations$home$tasks$ar extends Translations$home$tasks$en {
  _Translations$home$tasks$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'المهام';
  @override
  String get subtitle => 'تابع المهام والمهام الفرعية';
  @override
  String get prepare_meeting => 'تحضير الاجتماع الأسبوعي';
  @override
  String get prepare_meeting_1 => 'تأكيد الحضور';
  @override
  String get prepare_meeting_2 => 'تحضير خطة النشاط';
  @override
  String get camp_inventory => 'مراجعة مخزون المخيم';
  @override
  String get camp_inventory_1 => 'إحصاء الخيم';
  @override
  String get camp_inventory_2 => 'فحص مستلزمات الإسعاف';
  @override
  String get done => 'مكتملة';
  @override
  String get pending => 'قيد التنفيذ';
  @override
  String get access_denied => 'لا تملك صلاحية عرض المهام.';
}

// Path: home.calendar
class _Translations$home$calendar$ar extends Translations$home$calendar$en {
  _Translations$home$calendar$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'التقويم';
  @override
  String get subtitle => 'أنشطة هذا الشهر';
  @override
  String get meeting => 'اجتماع الفوج';
  @override
  String get training => 'تدريب قيادي';
  @override
  String get camp => 'مخيم نهاية الأسبوع';
  @override
  String get access_denied => 'لا تملك صلاحية عرض الأنشطة.';
}

// Path: home.more
class _Translations$home$more$ar extends Translations$home$more$en {
  _Translations$home$more$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'المزيد';
  @override
  String get profile => 'الملف الشخصي';
  @override
  String get notifications => 'الإشعارات';
  @override
  String get language => 'اللغة';
  @override
  String get theme => 'وضع المظهر';
  @override
  String get support => 'الدعم';
  @override
  String get help => 'مركز المساعدة';
  @override
  String get meeting_minutes => 'محاضر الاجتماعات';
  @override
  String get incoming_outgoing => 'الصادر والوارد';
  @override
  String get inventory => 'إدارة المخزون';
  @override
  String get activities => 'إدارة النشاط';
  @override
  String get camps => 'إدارة المخيم';
  @override
  String get logout => 'تسجيل الخروج';
}

// Path: home.create
class _Translations$home$create$ar extends Translations$home$create$en {
  _Translations$home$create$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get tooltip => 'إنشاء جديد';
  @override
  String get title => 'إنشاء جديد';
  @override
  String get subtitle => 'اختر الإجراء المطلوب';
  @override
  String get task => 'مهمة جديدة';
  @override
  String get event => 'نشاط جديد';
  @override
  String get member => 'عضو جديد';
  @override
  String get meeting => 'محضر اجتماع';
  @override
  String get inventory => 'حركة مخزون';
  @override
  String get correspondence => 'كتاب صادر أو وارد';
  @override
  String get no_actions => 'لا توجد إجراءات إنشاء متاحة ضمن صلاحياتك الحالية.';
}

// Path: home.common
class _Translations$home$common$ar extends Translations$home$common$en {
  _Translations$home$common$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get coming_soon => 'قريباً';
  @override
  String get access_denied => 'لا تملك صلاحية الوصول إلى هذا القسم.';
}

// Path: membership.verify_email
class _Translations$membership$verify_email$ar
    extends Translations$membership$verify_email$en {
  _Translations$membership$verify_email$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'تحقق من بريدك الإلكتروني';
  @override
  String description({required Object email}) =>
      'أرسلنا رابط التحقق إلى ${email}. لا يمكنك الدخول إلى الصفحة الرئيسية قبل التحقق.';
  @override
  String get verified_action => 'تحققت من بريدي الإلكتروني';
  @override
  String get resend_action => 'إعادة إرسال رسالة التحقق';
  @override
  String get resent => 'تم إرسال رسالة التحقق.';
}

// Path: membership.request
class _Translations$membership$request$ar
    extends Translations$membership$request$en {
  _Translations$membership$request$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'طلب الانتساب';
  @override
  String get subtitle => 'أكمل طلب الانتساب قبل الدخول إلى التطبيق.';
  @override
  late final _Translations$membership$request$steps$ar steps =
      _Translations$membership$request$steps$ar._(_root);
  @override
  String get full_name => 'الاسم الكامل';
  @override
  String get email => 'البريد الإلكتروني';
  @override
  String get phone => 'رقم الهاتف';
  @override
  String get address => 'العنوان التفصيلي';
  @override
  String get notes => 'ملاحظات';
  @override
  String get governorate => 'المحافظة';
  @override
  String get district => 'القضاء';
  @override
  String get cadaster => 'العقار / البلدة';
  @override
  String get choose_troop => 'اختر فوجاً';
  @override
  String get no_troop_title => 'لا يوجد فوج متاح حالياً في هذه المنطقة';
  @override
  String no_troop_description({required Object commission}) =>
      'سيتم إرسال طلبك إلى ${commission}. قد تتواصل معك المفوضية عند توفر فوج قريب أو عند وجود عدد كافٍ لدراسة إنشاء فوج جديد.';
  @override
  String get review_title => 'مراجعة الطلب';
  @override
  String get name => 'الاسم';
  @override
  String get destination => 'الجهة المستلمة';
  @override
  String get request_type => 'نوع الطلب';
  @override
  String get troop_membership => 'طلب انتساب إلى فوج';
  @override
  String get commission_interest => 'طلب اهتمام لدى المفوضية';
  @override
  String get commission_notice => 'ستراجع المفوضية المسؤولة هذا الطلب.';
  @override
  String get required => 'هذا الحقل مطلوب';
  @override
  String get select_location_error =>
      'اختر المحافظة والقضاء والعقار أو البلدة.';
  @override
  String get select_troop_error => 'اختر فوجاً.';
  @override
  String get back => 'السابق';
  @override
  String get next => 'التالي';
  @override
  String get submit => 'إرسال الطلب';
}

// Path: membership.status
class _Translations$membership$status$ar
    extends Translations$membership$status$en {
  _Translations$membership$status$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'حالة الطلب';
  @override
  String get under_review => 'طلبك قيد المراجعة';
  @override
  String request_number({required Object number}) => 'رقم الطلب: ${number}';
  @override
  String destination({required Object destination}) =>
      'أرسل إلى: ${destination}';
  @override
  String get notification_notice => 'سيصلك إشعار عند قبول طلب الانتساب.';
  @override
  String get approved_notification => 'تم قبول طلب الانتساب الخاص بك.';
  @override
  String get debug_approve => 'تجربة: قبول الطلب';
}

// Path: people.stages
class _Translations$people$stages$ar extends Translations$people$stages$en {
  _Translations$people$stages$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get cub => 'جرموز';
  @override
  String get scout => 'كشاف';
  @override
  String get rover => 'جوال';
  @override
  String get leader => 'قائد';
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

// Path: membership.request.steps
class _Translations$membership$request$steps$ar
    extends Translations$membership$request$steps$en {
  _Translations$membership$request$steps$ar._(TranslationsAr root)
    : this._root = root,
      super.internal(root);

  final TranslationsAr _root; // ignore: unused_field

  // Translations
  @override
  String get personal => 'المعلومات الشخصية';
  @override
  String get location => 'الموقع';
  @override
  String get troop => 'اختيار الفوج';
  @override
  String get review => 'المراجعة';
}
