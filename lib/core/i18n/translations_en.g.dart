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
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
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
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations
  late final Translations$app$en app = Translations$app$en.internal(_root);
  late final Translations$auth$en auth = Translations$auth$en.internal(_root);
  late final Translations$language$en language =
      Translations$language$en.internal(_root);
  late final Translations$startup$en startup = Translations$startup$en.internal(
    _root,
  );
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

// Path: auth
class Translations$auth$en {
  Translations$auth$en.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final Translations$auth$forgot_password$en forgot_password =
      Translations$auth$forgot_password$en.internal(
        _root,
      );
  late final Translations$auth$login$en login =
      Translations$auth$login$en.internal(_root);
  late final Translations$auth$register$en register =
      Translations$auth$register$en.internal(_root);
  late final Translations$auth$reset_password$en reset_password =
      Translations$auth$reset_password$en.internal(_root);
  late final Translations$auth$welcome$en welcome =
      Translations$auth$welcome$en.internal(_root);
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
  String get please_wait =>
      'Please wait while we prepare your scouting experience';
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
  String get subtitle =>
      'Enter your email and we will send a fake reset code for this demo.';

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

  /// en: 'Welcome back'
  ///
  /// ar: 'مرحباً بعودتك'
  String get title => 'Welcome back';

  /// en: 'Sign in to continue to Scouting Hub.'
  ///
  /// ar: 'سجّل الدخول للمتابعة إلى منصة الكشاف.'
  String get subtitle => 'Sign in to continue to Scouting Hub.';

  /// en: 'Email address'
  ///
  /// ar: 'البريد الإلكتروني'
  String get email => 'Email address';

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

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء حساب'
  String get register => 'Create account';

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
  String get subtitle =>
      'Join Scouting Hub and keep your scouting resources together.';

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
  String get invalid_code =>
      'The reset code is invalid. Use 123456 for the demo.';

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

  /// en: 'Welcome to Scouting Hub'
  ///
  /// ar: 'أهلاً بك في منصة الكشاف'
  String get title => 'Welcome to Scouting Hub';

  /// en: 'Your scouting library, activities, chants, and learning resources in one place.'
  ///
  /// ar: 'مكتبتك الكشفية والأنشطة والأناشيد والموارد التعليمية في مكان واحد.'
  String get subtitle =>
      'Your scouting library, activities, chants, and learning resources in one place.';

  /// en: 'Sign in'
  ///
  /// ar: 'تسجيل الدخول'
  String get login => 'Sign in';

  /// en: 'Create account'
  ///
  /// ar: 'إنشاء حساب'
  String get register => 'Create account';

  /// en: 'Continue as guest'
  ///
  /// ar: 'المتابعة كزائر'
  String get continue_as_guest => 'Continue as guest';
}
