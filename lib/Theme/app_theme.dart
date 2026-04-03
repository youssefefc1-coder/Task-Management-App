import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.light(
      primary: Color(0xff021526),
      secondary: Color(0xffFFFFFF),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xff021526).withValues(alpha: 0.4),
      suffixIconColor: Color(0xff021526).withValues(alpha: 0.4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff021526)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff021526)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff021526)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff021526),

    colorScheme: ColorScheme.dark(
      primary: Color(0xffFFFFFF),
      secondary: Color(0xff021526),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xffFFFFFF).withValues(alpha: 0.4),
      suffixIconColor: Color(0xffFFFFFF).withValues(alpha: 0.4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff6B7280)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff6B7280)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff6B7280)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
