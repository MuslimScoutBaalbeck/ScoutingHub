///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

typedef TranslationsEn = Translations;

class Translations with BaseTranslations<AppLocale, Translations> {
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta = meta ?? TranslationMetadata(locale: AppLocale.en, overrides: overrides ?? {}, cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  @override
  final TranslationMetadata<AppLocale, Translations> $meta;
  late final Translations _root = this;

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? $meta);

  late final Translations$app$en app = Translations$app$en.internal(_root);
  late final Translations$language$en language = Translations$language$en.internal(_root);
  late final Translations$startup$en startup = Translations$startup$en.internal(_root);
  late final Translations$auth$en auth = Translations$auth$en.internal(_root);
}

class Translations$app$en {
  Translations$app$en.internal(this._root);
  final Translations _root;
  String get name => 'Scouting Hub';
  String get tagline => 'Your digital scouting library';
  String get description => 'Explore scout chants, songs, lessons, rhythms, videos, books, and more — all in one place.';
}

class Translations$language$en {
  Translations$language$en.internal(this._root);
  final Translations _root;
  String get title => 'Languages';
  String get wait => 'Preparing your language...';
}

class Translations$startup$en {
  Translations$startup$en.internal(this._root);
  final Translations _root;
  String get failure_title => 'Startup failed';
  String get retry => 'Retry';
  String get loading => 'Preparing Scouting Hub...';
}

class Translations$auth$en {
  Translations$auth$en.internal(this._root);
  final Translations _root;
  late final Translations$auth$welcome$en welcome = Translations$auth$welcome$en.internal(_root);
  late final Translations$auth$login$en login = Translations$auth$login$en.internal(_root);
  late final Translations$auth$register$en register = Translations$auth$register$en.internal(_root);
  late final Translations$auth$forgot_password$en forgot_password = Translations$auth$forgot_password$en.internal(_root);
  late final Translations$auth$reset_password$en reset_password = Translations$auth$reset_password$en.internal(_root);
}

class Translations$auth$welcome$en {
  Translations$auth$welcome$en.internal(this._root);
  final Translations _root;
  String get title => 'Welcome to Scouting Hub';
  String get subtitle => 'Your scouting library, activities, chants, and learning resources in one place.';
  String get login => 'Sign in';
  String get register => 'Create account';
  String get continue_as_guest => 'Continue as guest';
}

class Translations$auth$login$en {
  Translations$auth$login$en.internal(this._root);
  final Translations _root;
  String get title => 'Welcome back';
  String get subtitle => 'Sign in to continue to Scouting Hub.';
  String get email => 'Email address';
  String get password => 'Password';
  String get forgot_password => 'Forgot password?';
  String get submit => 'Sign in';
  String get no_account => "Don't have an account?";
  String get register => 'Create account';
  String get demo_credentials => 'Demo: demo@example.com / password';
  String get invalid_credentials => 'The email or password is incorrect.';
  String get required_fields => 'Email and password are required.';
}

class Translations$auth$register$en {
  Translations$auth$register$en.internal(this._root);
  final Translations _root;
  String get title => 'Create your account';
  String get subtitle => 'Join Scouting Hub and keep your scouting resources together.';
  String get name => 'Full name';
  String get email => 'Email address';
  String get password => 'Password';
  String get password_confirmation => 'Confirm password';
  String get submit => 'Create account';
  String get have_account => 'Already have an account?';
  String get login => 'Sign in';
  String get password_hint => 'Use at least 8 characters.';
  String get password_mismatch => 'The password confirmation does not match.';
  String get validation_error => 'Complete all fields correctly.';
}

class Translations$auth$forgot_password$en {
  Translations$auth$forgot_password$en.internal(this._root);
  final Translations _root;
  String get title => 'Forgot password';
  String get subtitle => 'Enter your email and we will send a fake reset code for this demo.';
  String get email => 'Email address';
  String get submit => 'Send reset code';
  String get back_to_login => 'Back to sign in';
  String get success => 'Reset code sent. Use 123456 in the demo.';
  String get required_email => 'Enter your email address.';
}

class Translations$auth$reset_password$en {
  Translations$auth$reset_password$en.internal(this._root);
  final Translations _root;
  String get title => 'Reset password';
  String get subtitle => 'Enter the demo reset code and choose a new password.';
  String get email => 'Email address';
  String get code => 'Reset code';
  String get password => 'New password';
  String get password_confirmation => 'Confirm new password';
  String get submit => 'Reset password';
  String get success => 'Password reset successfully. You can now sign in.';
  String get invalid_code => 'The reset code is invalid. Use 123456 for the demo.';
  String get validation_error => 'Complete all fields correctly.';
}
