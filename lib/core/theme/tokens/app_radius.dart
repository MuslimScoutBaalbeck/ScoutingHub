import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  static const double xs = 6;
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 18;
  static const double xl = 24;
  static const double pill = 999;

  static const small = BorderRadius.all(Radius.circular(sm));
  static const medium = BorderRadius.all(Radius.circular(md));
  static const large = BorderRadius.all(Radius.circular(lg));
  static const extraLarge = BorderRadius.all(Radius.circular(xl));
  static const fullyRounded = BorderRadius.all(Radius.circular(pill));
}
