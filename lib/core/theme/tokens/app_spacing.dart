import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  static const double none = 0;
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  static const page = EdgeInsets.symmetric(horizontal: lg);
  static const pageWithBottom = EdgeInsets.fromLTRB(lg, md, lg, xl);
  static const card = EdgeInsets.all(md);
  static const section = EdgeInsets.symmetric(vertical: lg);
}