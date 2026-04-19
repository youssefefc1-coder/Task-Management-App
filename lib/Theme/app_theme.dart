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

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      headerForegroundColor: Color(0xff021526),
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
    ),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteTextColor: Color(0xff021526),
      hourMinuteColor: Color(0xff021526),
      dialBackgroundColor: Colors.white,
      dialHandColor: Color(0xff021526),
      dialTextColor: Color(0xff021526),
      dayPeriodColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),

      dayPeriodTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
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

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Color(0xff021526),
      headerBackgroundColor: Color(0xff021526),
      headerForegroundColor: Colors.white,
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
    ),
  );
}
