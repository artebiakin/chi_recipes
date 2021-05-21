import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF161F3D);
  static const black60 = Color(0xFF74798B);
  static const _accent = Color(0xFFE9446A);
  static const lightGray = Color(0xFFFBFCFE);
  static const red = Color(0xFFFF0019);
  static const white = Color(0xFFFFFFFF);
  static const grayBlue = Color(0xFFF2F3FA);
  static final accent = MaterialColor(
    0xFFE9446A,
    <int, Color>{
      50: _accent.withOpacity(.05),
      100: _accent.withOpacity(.1),
      200: _accent.withOpacity(.2),
      300: _accent.withOpacity(.3),
      400: _accent.withOpacity(.4),
      500: _accent.withOpacity(.5),
      600: _accent.withOpacity(.6),
      700: _accent.withOpacity(.7),
      800: _accent.withOpacity(.8),
      900: _accent.withOpacity(.9),
    },
  );
}

// Light theme data
ThemeData get lightThemeData => ThemeData();

// Dark theme data
ThemeData get darkThemeData => ThemeData(brightness: Brightness.dark);
