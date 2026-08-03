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
  late final Translations$auth$en auth = Translations$auth$en.internal(_root);
  late final Translations$home$en home = Translations$home$en.internal(_root);
  late final Translations$language$en language = Translations$language$en.internal(_root);
  late final Translations$people$en people = Translations$people$en.internal(_root);
  late final Translations$startup$en startup = Translations$startup$en.internal(_root);
}

// Path: app
class Translations$app$en {
  Translations$app$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Muslim Scout APP'
  ///
  /// ar: 'الكشاف المسلم'
  String get name => 'Muslim Scout APP';

  /// en: 'Manage your scout group and everything you need for your adventure'
  ///
  /// ar: 'إدارة فوجك وكل ما تحتاجه في مغامرتك الكشفية'
  String get tagline => 'Manage your scout group and everything you need for your adventure';

  /// en: 'A complete app for managing scout groups, members, activities, tasks, chants, and everything you need throughout your scouting journey.'
  ///
  /// ar: 'تطبيق متكامل لإدارة الأفواج والأعضاء والأنشطة والمهام والأناشيد، وكل ما تحتاجه طوال رحلتك الكشفية.'
  String get description =>
      'A complete app for managing scout groups, members, activities, tasks, chants, and everything you need throughout your scouting journey.';
}

// Path: auth
class Translations$auth$en {
  Translations$auth$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$auth$errors$en errors = Translations$auth$errors$en.internal(_root);
  late final Translations$auth$forgot_password$en forgot_password = Translations$auth$forgot_password$en.internal(
    _root,
  );
  late final Translations$auth$login$en login = Translations$auth$login$en.internal(_root);
  late final Translations$auth$register$en register = Translations$auth$register$en.internal(_root);
  late final Translations$auth$reset_password$en reset_password = Translations$auth$reset_password$en.internal(_root);
  late final Translations$auth$welcome$en welcome = Translations$auth$welcome$en.internal(_root);
}

// Path: home
class Translations$home$en {
  Translations$home$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$home$navigation$en navigation = Translations$home$navigation$en.internal(_root);
  late final Translations$home$dashboard$en dashboard = Translations$home$dashboard$en.internal(_root);
  late final Translations$home$tasks$en tasks = Translations$home$tasks$en.internal(_root);
  late final Translations$home$calendar$en calendar = Translations$home$calendar$en.internal(_root);
  late final Translations$home$more$en more = Translations$home$more$en.internal(_root);
  late final Translations$home$create$en create = Translations$home$create$en.internal(_root);
  late final Translations$home$common$en common = Translations$home$common$en.internal(_root);
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

// Path: people
class Translations$people$en {
  Translations$people$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Members'
  ///
  /// ar: 'الأعضاء'
  String get title => 'Members';

  /// en: 'Manage troop members and membership records'
  ///
  /// ar: 'إدارة أعضاء الفوج وسجلات الانتساب'
  String get subtitle => 'Manage troop members and membership records';

  /// en: 'Member management'
  ///
  /// ar: 'إدارة الأعضاء'
  String get dashboard => 'Member management';

  /// en: 'Membership, requests, records, and reports'
  ///
  /// ar: 'العضوية والطلبات والسجلات والتقارير'
  String get dashboard_subtitle => 'Membership, requests, records, and reports';

  /// en: 'Search members'
  ///
  /// ar: 'البحث عن عضو'
  String get search => 'Search members';

  /// en: 'Filter'
  ///
  /// ar: 'تصفية'
  String get filter => 'Filter';

  /// en: 'Member filters'
  ///
  /// ar: 'فلاتر الأعضاء'
  String get filters => 'Member filters';

  /// en: 'Apply filters'
  ///
  /// ar: 'تطبيق الفلاتر'
  String get apply_filters => 'Apply filters';

  /// en: 'Clear all filters'
  ///
  /// ar: 'إزالة جميع الفلاتر'
  String get clear_filters => 'Clear all filters';

  /// en: 'All stages'
  ///
  /// ar: 'جميع المراحل'
  String get all_stages => 'All stages';

  /// en: 'All statuses'
  ///
  /// ar: 'جميع الحالات'
  String get all_statuses => 'All statuses';

  /// en: 'Add member'
  ///
  /// ar: 'إضافة عضو'
  String get add => 'Add member';

  /// en: 'Edit member'
  ///
  /// ar: 'تعديل العضو'
  String get edit => 'Edit member';

  /// en: 'Member details'
  ///
  /// ar: 'تفاصيل العضو'
  String get details => 'Member details';

  /// en: 'Save member'
  ///
  /// ar: 'حفظ العضو'
  String get save => 'Save member';

  /// en: 'Next'
  ///
  /// ar: 'التالي'
  String get next => 'Next';

  /// en: 'Back'
  ///
  /// ar: 'السابق'
  String get back => 'Back';

  /// en: 'Finish'
  ///
  /// ar: 'إنهاء'
  String get finish => 'Finish';

  /// en: 'Active'
  ///
  /// ar: 'فاعل'
  String get active => 'Active';

  /// en: 'Pending'
  ///
  /// ar: 'قيد المراجعة'
  String get pending => 'Pending';

  /// en: 'Inactive'
  ///
  /// ar: 'غير فاعل'
  String get inactive => 'Inactive';

  /// en: 'Archived'
  ///
  /// ar: 'مؤرشف'
  String get archived => 'Archived';

  /// en: 'Profile complete'
  ///
  /// ar: 'الملف مكتمل'
  String get complete => 'Profile complete';

  /// en: 'Profile incomplete'
  ///
  /// ar: 'الملف غير مكتمل'
  String get incomplete => 'Profile incomplete';

  /// en: 'No members match your search or filters.'
  ///
  /// ar: 'لا يوجد أعضاء مطابقون للبحث أو الفلاتر.'
  String get empty => 'No members match your search or filters.';

  /// en: 'Unable to load members. Please try again.'
  ///
  /// ar: 'تعذر تحميل الأعضاء. حاول مجدداً.'
  String get unexpected_error => 'Unable to load members. Please try again.';

  /// en: 'Retry'
  ///
  /// ar: 'إعادة المحاولة'
  String get retry => 'Retry';

  /// en: 'Membership #'
  ///
  /// ar: 'رقم العضوية'
  String get membership_number => 'Membership #';

  /// en: '$count members'
  ///
  /// ar: '$count أعضاء'
  String members_count({required Object count}) => '${count} members';

  /// en: 'Total members'
  ///
  /// ar: 'إجمالي الأعضاء'
  String get total_members => 'Total members';

  /// en: 'Active members'
  ///
  /// ar: 'الأعضاء الفاعلون'
  String get active_members => 'Active members';

  /// en: 'Pending requests'
  ///
  /// ar: 'طلبات قيد المراجعة'
  String get pending_requests => 'Pending requests';

  /// en: 'Incomplete profiles'
  ///
  /// ar: 'ملفات غير مكتملة'
  String get incomplete_profiles => 'Incomplete profiles';

  /// en: 'Members list'
  ///
  /// ar: 'قائمة الأعضاء'
  String get members_list => 'Members list';

  /// en: 'Membership requests'
  ///
  /// ar: 'طلبات الانتساب'
  String get membership_requests => 'Membership requests';

  /// en: 'Reports'
  ///
  /// ar: 'التقارير'
  String get reports => 'Reports';

  /// en: 'Recent members'
  ///
  /// ar: 'أحدث الأعضاء'
  String get recent_members => 'Recent members';

  /// en: 'Personal information'
  ///
  /// ar: 'المعلومات الشخصية'
  String get personal_information => 'Personal information';

  /// en: 'Scout information'
  ///
  /// ar: 'المعلومات الكشفية'
  String get scout_information => 'Scout information';

  /// en: 'Contact information'
  ///
  /// ar: 'معلومات الاتصال'
  String get contact_information => 'Contact information';

  /// en: 'Review'
  ///
  /// ar: 'المراجعة'
  String get review => 'Review';

  /// en: 'Full name'
  ///
  /// ar: 'الاسم الكامل'
  String get full_name => 'Full name';

  /// en: 'Phone'
  ///
  /// ar: 'رقم الهاتف'
  String get phone => 'Phone';

  /// en: 'Email'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email';

  /// en: 'Address'
  ///
  /// ar: 'العنوان'
  String get address => 'Address';

  /// en: 'Emergency contact'
  ///
  /// ar: 'جهة اتصال للطوارئ'
  String get emergency_contact => 'Emergency contact';

  /// en: 'Unit'
  ///
  /// ar: 'الوحدة'
  String get unit => 'Unit';

  /// en: 'Stage'
  ///
  /// ar: 'المرحلة'
  String get stage => 'Stage';

  /// en: 'Status'
  ///
  /// ar: 'الحالة'
  String get status => 'Status';

  /// en: 'Joined at'
  ///
  /// ar: 'تاريخ الانتساب'
  String get joined_at => 'Joined at';

  /// en: 'Notes'
  ///
  /// ar: 'ملاحظات'
  String get notes => 'Notes';

  /// en: 'New'
  ///
  /// ar: 'جديد'
  String get request_new => 'New';

  /// en: 'Under review'
  ///
  /// ar: 'قيد التدقيق'
  String get request_review => 'Under review';

  /// en: 'Needs information'
  ///
  /// ar: 'يحتاج معلومات'
  String get request_needs_info => 'Needs information';

  /// en: 'Approved'
  ///
  /// ar: 'مقبول'
  String get request_approved => 'Approved';

  /// en: 'Members by stage'
  ///
  /// ar: 'الأعضاء حسب المرحلة'
  String get report_by_stage => 'Members by stage';

  /// en: 'Incomplete profiles'
  ///
  /// ar: 'الملفات غير المكتملة'
  String get report_incomplete => 'Incomplete profiles';

  /// en: 'New members'
  ///
  /// ar: 'الأعضاء الجدد'
  String get report_new_members => 'New members';

  /// en: 'Contact directory'
  ///
  /// ar: 'دليل التواصل'
  String get report_contacts => 'Contact directory';

  /// en: 'Export'
  ///
  /// ar: 'تصدير'
  String get export => 'Export';

  /// en: 'Member saved successfully.'
  ///
  /// ar: 'تم حفظ العضو بنجاح.'
  String get saved => 'Member saved successfully.';

  late final Translations$people$stages$en stages = Translations$people$stages$en.internal(_root);
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

  /// en: 'Muslim Scout Association in Lebanon'
  ///
  /// ar: 'جمعية الكشاف المسلم في لبنان'
  String get organization => 'Muslim Scout Association in Lebanon';

  /// en: 'Preparing Scouting Hub...'
  ///
  /// ar: 'جاري تجهيز المنصة الكشفية...'
  String get loading => 'Preparing Scouting Hub...';

  /// en: 'Please wait while we prepare your scouting experience'
  ///
  /// ar: 'يرجى الانتظار ريثما نجهّز تجربتك الكشفية'
  String get please_wait => 'Please wait while we prepare your scouting experience';
}

// Path: auth.errors
class Translations$auth$errors$en {
  Translations$auth$errors$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Email is required.'
  ///
  /// ar: 'البريد الإلكتروني مطلوب.'
  String get email_required => 'Email is required.';

  /// en: 'Email and password are required.'
  ///
  /// ar: 'البريد الإلكتروني وكلمة المرور مطلوبان.'
  String get email_password_required => 'Email and password are required.';

  /// en: 'Enter a name and valid email, and use a password with at least 8 characters.'
  ///
  /// ar: 'أدخل الاسم والبريد الإلكتروني بشكل صحيح، واستخدم كلمة مرور من 8 أحرف على الأقل.'
  String get registration_fields_invalid =>
      'Enter a name and valid email, and use a password with at least 8 characters.';

  /// en: 'The password confirmation does not match.'
  ///
  /// ar: 'تأكيد كلمة المرور غير مطابق.'
  String get password_mismatch => 'The password confirmation does not match.';

  /// en: 'Complete all fields correctly and use a password with at least 8 characters.'
  ///
  /// ar: 'أكمل جميع الحقول بشكل صحيح، واستخدم كلمة مرور من 8 أحرف على الأقل.'
  String get reset_fields_invalid => 'Complete all fields correctly and use a password with at least 8 characters.';

  /// en: 'The email or password is incorrect.'
  ///
  /// ar: 'البريد الإلكتروني أو كلمة المرور غير صحيحة.'
  String get invalid_credentials => 'The email or password is incorrect.';

  /// en: 'An account already exists for this email address.'
  ///
  /// ar: 'يوجد حساب مسجل مسبقاً بهذا البريد الإلكتروني.'
  String get email_already_exists => 'An account already exists for this email address.';

  /// en: 'The password reset code is invalid.'
  ///
  /// ar: 'رمز إعادة تعيين كلمة المرور غير صحيح.'
  String get invalid_reset_code => 'The password reset code is invalid.';

  /// en: 'No authenticated session exists.'
  ///
  /// ar: 'لا توجد جلسة مستخدم مسجلة.'
  String get unauthenticated => 'No authenticated session exists.';

  /// en: 'An unexpected error occurred. Please try again.'
  ///
  /// ar: 'حدث خطأ غير متوقع. حاول مرة أخرى.'
  String get unexpected => 'An unexpected error occurred. Please try again.';
}

// Path: auth.forgot_password
class Translations$auth$forgot_password$en {
  Translations$auth$forgot_password$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Forgot password'
  ///
  /// ar: 'نسيت كلمة المرور'
  String get title => 'Forgot password';

  /// en: 'Enter your email and we will send a fake reset code for this demo.'
  ///
  /// ar: 'أدخل بريدك الإلكتروني وسنرسل رمز إعادة تعيين تجريبي.'
  String get subtitle => 'Enter your email and we will send a fake reset code for this demo.';

  /// en: 'Email address'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email address';

  /// en: 'Send reset code'
  ///
  /// ar: 'إرسال رمز إعادة التعيين'
  String get submit => 'Send reset code';

  /// en: 'Back to sign in'
  ///
  /// ar: 'العودة إلى تسجيل الدخول'
  String get back_to_login => 'Back to sign in';

  /// en: 'Reset code sent. Use 123456 in the demo.'
  ///
  /// ar: 'تم إرسال الرمز. استخدم 123456 في النسخة التجريبية.'
  String get success => 'Reset code sent. Use 123456 in the demo.';

  /// en: 'Enter your email address.'
  ///
  /// ar: 'أدخل بريدك الإلكتروني.'
  String get required_email => 'Enter your email address.';
}

// Path: auth.login
class Translations$auth$login$en {
  Translations$auth$login$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome to Muslim Scout APP'
  ///
  /// ar: 'مرحباً بك في منصة الكشاف المسلم'
  String get title => 'Welcome to\nMuslim Scout APP';

  /// en: 'Login to continue your adventure'
  ///
  /// ar: 'سجّل الدخول لمتابعة مغامرتك'
  String get subtitle => 'Login to continue your adventure';

  /// en: 'Start'
  ///
  /// ar: 'ابدأ'
  String get adventure_prefix => 'Start';

  late final Translations$auth$login$adventure_words$en adventure_words =
      Translations$auth$login$adventure_words$en.internal(_root);

  /// en: 'Email'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email';

  /// en: 'Password'
  ///
  /// ar: 'كلمة المرور'
  String get password => 'Password';

  /// en: 'Forgot password?'
  ///
  /// ar: 'نسيت كلمة المرور؟'
  String get forgot_password => 'Forgot password?';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get submit => 'Sign in';

  /// en: 'Don't have an account?'
  ///
  /// ar: 'ليس لديك حساب؟'
  String get no_account => 'Don\'t have an account?';

  /// en: 'Sign up'
  ///
  /// ar: 'إنشاء حساب'
  String get register => 'Sign up';

  /// en: 'Or'
  ///
  /// ar: 'أو'
  String get or => 'Or';

  /// en: 'Google'
  ///
  /// ar: 'Google'
  String get google => 'Google';

  /// en: 'Apple'
  ///
  /// ar: 'Apple'
  String get apple => 'Apple';

  /// en: 'Coming soon'
  ///
  /// ar: 'قريباً'
  String get coming_soon => 'Coming soon';

  /// en: 'Switch language'
  ///
  /// ar: 'تبديل اللغة'
  String get switch_language => 'Switch language';

  /// en: 'Switch theme'
  ///
  /// ar: 'تبديل المظهر'
  String get switch_theme => 'Switch theme';

  /// en: 'Show password'
  ///
  /// ar: 'إظهار كلمة المرور'
  String get show_password => 'Show password';

  /// en: 'Hide password'
  ///
  /// ar: 'إخفاء كلمة المرور'
  String get hide_password => 'Hide password';

  /// en: 'Demo: demo@example.com / password'
  ///
  /// ar: 'للتجربة: demo@example.com / password'
  String get demo_credentials => 'Demo: demo@example.com / password';

  /// en: 'The email or password is incorrect.'
  ///
  /// ar: 'البريد الإلكتروني أو كلمة المرور غير صحيحة.'
  String get invalid_credentials => 'The email or password is incorrect.';

  /// en: 'Email and password are required.'
  ///
  /// ar: 'البريد الإلكتروني وكلمة المرور مطلوبان.'
  String get required_fields => 'Email and password are required.';
}

// Path: auth.register
class Translations$auth$register$en {
  Translations$auth$register$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Create your account'
  ///
  /// ar: 'إنشاء حساب جديد'
  String get title => 'Create your account';

  /// en: 'Join Scouting Hub and keep your scouting resources together.'
  ///
  /// ar: 'انضم إلى منصة الكشاف واحتفظ بمواردك الكشفية في مكان واحد.'
  String get subtitle => 'Join Scouting Hub and keep your scouting resources together.';

  /// en: 'Full name'
  ///
  /// ar: 'الاسم الكامل'
  String get name => 'Full name';

  /// en: 'Email address'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email address';

  /// en: 'Password'
  ///
  /// ar: 'كلمة المرور'
  String get password => 'Password';

  /// en: 'Confirm password'
  ///
  /// ar: 'تأكيد كلمة المرور'
  String get password_confirmation => 'Confirm password';

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء الحساب'
  String get submit => 'Create account';

  /// en: 'Already have an account?'
  ///
  /// ar: 'لديك حساب بالفعل؟'
  String get have_account => 'Already have an account?';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get login => 'Sign in';

  /// en: 'Use at least 8 characters.'
  ///
  /// ar: 'استخدم 8 أحرف على الأقل.'
  String get password_hint => 'Use at least 8 characters.';

  /// en: 'The password confirmation does not match.'
  ///
  /// ar: 'تأكيد كلمة المرور غير متطابق.'
  String get password_mismatch => 'The password confirmation does not match.';

  /// en: 'Complete all fields correctly.'
  ///
  /// ar: 'أكمل جميع الحقول بشكل صحيح.'
  String get validation_error => 'Complete all fields correctly.';
}

// Path: auth.reset_password
class Translations$auth$reset_password$en {
  Translations$auth$reset_password$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Reset password'
  ///
  /// ar: 'إعادة تعيين كلمة المرور'
  String get title => 'Reset password';

  /// en: 'Enter the demo reset code and choose a new password.'
  ///
  /// ar: 'أدخل رمز إعادة التعيين التجريبي واختر كلمة مرور جديدة.'
  String get subtitle => 'Enter the demo reset code and choose a new password.';

  /// en: 'Email address'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email address';

  /// en: 'Reset code'
  ///
  /// ar: 'رمز إعادة التعيين'
  String get code => 'Reset code';

  /// en: 'New password'
  ///
  /// ar: 'كلمة المرور الجديدة'
  String get password => 'New password';

  /// en: 'Confirm new password'
  ///
  /// ar: 'تأكيد كلمة المرور الجديدة'
  String get password_confirmation => 'Confirm new password';

  /// en: 'Reset password'
  ///
  /// ar: 'إعادة تعيين كلمة المرور'
  String get submit => 'Reset password';

  /// en: 'Password reset successfully. You can now sign in.'
  ///
  /// ar: 'تمت إعادة تعيين كلمة المرور. يمكنك تسجيل الدخول الآن.'
  String get success => 'Password reset successfully. You can now sign in.';

  /// en: 'The reset code is invalid. Use 123456 for the demo.'
  ///
  /// ar: 'رمز إعادة التعيين غير صحيح. استخدم 123456 للتجربة.'
  String get invalid_code => 'The reset code is invalid. Use 123456 for the demo.';

  /// en: 'Complete all fields correctly.'
  ///
  /// ar: 'أكمل جميع الحقول بشكل صحيح.'
  String get validation_error => 'Complete all fields correctly.';
}

// Path: auth.welcome
class Translations$auth$welcome$en {
  Translations$auth$welcome$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome to Muslim Scout APP'
  ///
  /// ar: 'أهلاً بك في تطبيق الكشاف المسلم'
  String get title => 'Welcome to Muslim Scout APP';

  /// en: 'Manage your scout group and everything you need for your scouting adventure.'
  ///
  /// ar: 'أدِر فوجك وكل ما تحتاجه في مغامرتك الكشفية.'
  String get subtitle => 'Manage your scout group and everything you need for your scouting adventure.';

  /// en: 'Get started'
  ///
  /// ar: 'ابدأ الآن'
  String get get_started => 'Get started';

  /// en: 'Preferences'
  ///
  /// ar: 'الإعدادات الأولية'
  String get preferences => 'Preferences';

  /// en: 'Language'
  ///
  /// ar: 'اللغة'
  String get language => 'Language';

  /// en: 'English'
  ///
  /// ar: 'الإنجليزية'
  String get english => 'English';

  /// en: 'Arabic'
  ///
  /// ar: 'العربية'
  String get arabic => 'Arabic';

  /// en: 'Appearance'
  ///
  /// ar: 'المظهر'
  String get appearance => 'Appearance';

  /// en: 'System'
  ///
  /// ar: 'حسب النظام'
  String get theme_system => 'System';

  /// en: 'Light'
  ///
  /// ar: 'فاتح'
  String get theme_light => 'Light';

  /// en: 'Dark'
  ///
  /// ar: 'داكن'
  String get theme_dark => 'Dark';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get login => 'Sign in';

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء حساب'
  String get register => 'Create account';

  /// en: 'Explore as guest'
  ///
  /// ar: 'الاستكشاف كزائر'
  String get continue_as_guest => 'Explore as guest';
}

// Path: home.navigation
class Translations$home$navigation$en {
  Translations$home$navigation$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Dashboard'
  ///
  /// ar: 'الرئيسية'
  String get dashboard => 'Dashboard';

  /// en: 'Tasks'
  ///
  /// ar: 'المهام'
  String get tasks => 'Tasks';

  /// en: 'Calendar'
  ///
  /// ar: 'التقويم'
  String get calendar => 'Calendar';

  /// en: 'More'
  ///
  /// ar: 'المزيد'
  String get more => 'More';
}

// Path: home.dashboard
class Translations$home$dashboard$en {
  Translations$home$dashboard$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Welcome back'
  ///
  /// ar: 'مرحباً بعودتك'
  String get welcome_back => 'Welcome back';

  /// en: 'Demo Scout'
  ///
  /// ar: 'الكشاف التجريبي'
  String get user_name => 'Demo Scout';

  /// en: 'Notifications'
  ///
  /// ar: 'الإشعارات'
  String get notifications => 'Notifications';

  /// en: 'Upcoming event'
  ///
  /// ar: 'نشاط قادم'
  String get upcoming_title => 'Upcoming event';

  /// en: 'Weekly troop meeting'
  ///
  /// ar: 'الاجتماع الأسبوعي للفوج'
  String get upcoming_name => 'Weekly troop meeting';

  /// en: 'Tomorrow at 5:00 PM · Scout hall'
  ///
  /// ar: 'غداً الساعة 5:00 مساءً · مقر الفوج'
  String get upcoming_details => 'Tomorrow at 5:00 PM · Scout hall';

  /// en: 'Quick access'
  ///
  /// ar: 'وصول سريع'
  String get quick_access => 'Quick access';

  /// en: 'Events'
  ///
  /// ar: 'الأنشطة'
  String get events => 'Events';

  /// en: 'Tasks'
  ///
  /// ar: 'المهام'
  String get tasks => 'Tasks';

  /// en: 'Teams'
  ///
  /// ar: 'الفرق'
  String get teams => 'Teams';

  /// en: 'Members'
  ///
  /// ar: 'الأعضاء'
  String get members => 'Members';

  /// en: 'Chants'
  ///
  /// ar: 'الأناشيد'
  String get chants => 'Chants';

  /// en: 'Games'
  ///
  /// ar: 'الألعاب'
  String get games => 'Games';

  /// en: 'Inventory'
  ///
  /// ar: 'المخزون'
  String get inventory => 'Inventory';

  /// en: 'Your responsibilities'
  ///
  /// ar: 'مسؤولياتك'
  String get assignments => 'Your responsibilities';

  /// en: 'Active responsibility'
  ///
  /// ar: 'المسؤولية الحالية'
  String get active_assignment => 'Active responsibility';

  /// en: 'No responsibility assigned'
  ///
  /// ar: 'لا توجد مسؤولية مسندة إليك'
  String get no_assignment => 'No responsibility assigned';

  /// en: 'No quick-access modules are available for your permissions.'
  ///
  /// ar: 'لا توجد وحدات وصول سريع متاحة ضمن صلاحياتك الحالية.'
  String get no_access => 'No quick-access modules are available for your permissions.';

  /// en: 'No modules are available for your current permissions.'
  ///
  /// ar: 'لا توجد وحدات متاحة ضمن صلاحياتك الحالية.'
  String get no_modules => 'No modules are available for your current permissions.';
}

// Path: home.tasks
class Translations$home$tasks$en {
  Translations$home$tasks$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tasks'
  ///
  /// ar: 'المهام'
  String get title => 'Tasks';

  /// en: 'Track assignments and subtasks'
  ///
  /// ar: 'تابع المهام والمهام الفرعية'
  String get subtitle => 'Track assignments and subtasks';

  /// en: 'Prepare the weekly meeting'
  ///
  /// ar: 'تحضير الاجتماع الأسبوعي'
  String get prepare_meeting => 'Prepare the weekly meeting';

  /// en: 'Confirm attendance'
  ///
  /// ar: 'تأكيد الحضور'
  String get prepare_meeting_1 => 'Confirm attendance';

  /// en: 'Prepare the activity plan'
  ///
  /// ar: 'تحضير خطة النشاط'
  String get prepare_meeting_2 => 'Prepare the activity plan';

  /// en: 'Review camp inventory'
  ///
  /// ar: 'مراجعة مخزون المخيم'
  String get camp_inventory => 'Review camp inventory';

  /// en: 'Count tents'
  ///
  /// ar: 'إحصاء الخيم'
  String get camp_inventory_1 => 'Count tents';

  /// en: 'Check first-aid supplies'
  ///
  /// ar: 'فحص مستلزمات الإسعاف'
  String get camp_inventory_2 => 'Check first-aid supplies';

  /// en: 'Completed'
  ///
  /// ar: 'مكتملة'
  String get done => 'Completed';

  /// en: 'Pending'
  ///
  /// ar: 'قيد التنفيذ'
  String get pending => 'Pending';

  /// en: 'You do not have permission to view tasks.'
  ///
  /// ar: 'لا تملك صلاحية عرض المهام.'
  String get access_denied => 'You do not have permission to view tasks.';
}

// Path: home.calendar
class Translations$home$calendar$en {
  Translations$home$calendar$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Calendar'
  ///
  /// ar: 'التقويم'
  String get title => 'Calendar';

  /// en: 'Events for this month'
  ///
  /// ar: 'أنشطة هذا الشهر'
  String get subtitle => 'Events for this month';

  /// en: 'Troop meeting'
  ///
  /// ar: 'اجتماع الفوج'
  String get meeting => 'Troop meeting';

  /// en: 'Leadership training'
  ///
  /// ar: 'تدريب قيادي'
  String get training => 'Leadership training';

  /// en: 'Weekend camp'
  ///
  /// ar: 'مخيم نهاية الأسبوع'
  String get camp => 'Weekend camp';

  /// en: 'You do not have permission to view events.'
  ///
  /// ar: 'لا تملك صلاحية عرض الأنشطة.'
  String get access_denied => 'You do not have permission to view events.';
}

// Path: home.more
class Translations$home$more$en {
  Translations$home$more$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'More'
  ///
  /// ar: 'المزيد'
  String get title => 'More';

  /// en: 'Profile'
  ///
  /// ar: 'الملف الشخصي'
  String get profile => 'Profile';

  /// en: 'Notifications'
  ///
  /// ar: 'الإشعارات'
  String get notifications => 'Notifications';

  /// en: 'Language'
  ///
  /// ar: 'اللغة'
  String get language => 'Language';

  /// en: 'Theme mode'
  ///
  /// ar: 'وضع المظهر'
  String get theme => 'Theme mode';

  /// en: 'Support'
  ///
  /// ar: 'الدعم'
  String get support => 'Support';

  /// en: 'Help center'
  ///
  /// ar: 'مركز المساعدة'
  String get help => 'Help center';

  /// en: 'Meeting minutes'
  ///
  /// ar: 'محاضر الاجتماعات'
  String get meeting_minutes => 'Meeting minutes';

  /// en: 'Incoming and outgoing mail'
  ///
  /// ar: 'الصادر والوارد'
  String get incoming_outgoing => 'Incoming and outgoing mail';

  /// en: 'Inventory management'
  ///
  /// ar: 'إدارة المخزون'
  String get inventory => 'Inventory management';

  /// en: 'Activity management'
  ///
  /// ar: 'إدارة النشاط'
  String get activities => 'Activity management';

  /// en: 'Camp management'
  ///
  /// ar: 'إدارة المخيم'
  String get camps => 'Camp management';

  /// en: 'Log out'
  ///
  /// ar: 'تسجيل الخروج'
  String get logout => 'Log out';
}

// Path: home.create
class Translations$home$create$en {
  Translations$home$create$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Create new'
  ///
  /// ar: 'إنشاء جديد'
  String get tooltip => 'Create new';

  /// en: 'Create new'
  ///
  /// ar: 'إنشاء جديد'
  String get title => 'Create new';

  /// en: 'Choose an action'
  ///
  /// ar: 'اختر الإجراء المطلوب'
  String get subtitle => 'Choose an action';

  /// en: 'New task'
  ///
  /// ar: 'مهمة جديدة'
  String get task => 'New task';

  /// en: 'New event'
  ///
  /// ar: 'نشاط جديد'
  String get event => 'New event';

  /// en: 'New member'
  ///
  /// ar: 'عضو جديد'
  String get member => 'New member';

  /// en: 'Meeting minutes'
  ///
  /// ar: 'محضر اجتماع'
  String get meeting => 'Meeting minutes';

  /// en: 'Inventory transaction'
  ///
  /// ar: 'حركة مخزون'
  String get inventory => 'Inventory transaction';

  /// en: 'Incoming or outgoing mail'
  ///
  /// ar: 'كتاب صادر أو وارد'
  String get correspondence => 'Incoming or outgoing mail';

  /// en: 'No creation actions are available for your permissions.'
  ///
  /// ar: 'لا توجد إجراءات إنشاء متاحة ضمن صلاحياتك الحالية.'
  String get no_actions => 'No creation actions are available for your permissions.';
}

// Path: home.common
class Translations$home$common$en {
  Translations$home$common$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Coming soon'
  ///
  /// ar: 'قريباً'
  String get coming_soon => 'Coming soon';

  /// en: 'You do not have permission to access this section.'
  ///
  /// ar: 'لا تملك صلاحية الوصول إلى هذا القسم.'
  String get access_denied => 'You do not have permission to access this section.';
}

// Path: people.stages
class Translations$people$stages$en {
  Translations$people$stages$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Cub'
  ///
  /// ar: 'جرموز'
  String get cub => 'Cub';

  /// en: 'Scout'
  ///
  /// ar: 'كشاف'
  String get scout => 'Scout';

  /// en: 'Rover'
  ///
  /// ar: 'جوال'
  String get rover => 'Rover';

  /// en: 'Leader'
  ///
  /// ar: 'قائد'
  String get leader => 'Leader';
}

// Path: auth.login.adventure_words
class Translations$auth$login$adventure_words$en {
  Translations$auth$login$adventure_words$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'your adventure'
  ///
  /// ar: 'مغامرتك'
  String get adventure => 'your adventure';

  /// en: 'exploring'
  ///
  /// ar: 'الاستكشاف'
  String get explore => 'exploring';

  /// en: 'managing'
  ///
  /// ar: 'الإدارة'
  String get manage => 'managing';

  /// en: 'leading'
  ///
  /// ar: 'القيادة'
  String get lead => 'leading';

  /// en: 'and more'
  ///
  /// ar: 'والمزيد'
  String get more => 'and more';
}
