import 'package:flutter/widgets.dart';

abstract final class SliSpacing {
  static const double none = 0;
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

abstract final class SliRadii {
  static const double sm = 6;
  static const double md = 10;
  static const double lg = 14;
  static const double pill = 999;
}

abstract final class SliDurations {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 320);
}

abstract final class SliTouchTarget {
  static const Size minimum = Size(48, 48);
  static const double minimumWidth = 48;
  static const double minimumHeight = 48;
}
