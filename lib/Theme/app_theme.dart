import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xff021526),
      selectionColor: Color(0xff021526),
      selectionHandleColor: Color(0xff021526),
    ),

    colorScheme: ColorScheme.light(
      primary: Color(0xff021526),
      secondary: Color(0xffFFFFFF),
      onPrimary: Color(0xffFFEDD5),
      onSecondary: Color(0xffC2410C),
      tertiary: Color(0xffFBBF24),
      onTertiary: Color(0xff78350F),
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
      errorStyle: TextStyle(color: Colors.red),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      headerForegroundColor: Color(0xff021526),
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.transparent;
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
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xff021526))),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xff021526))),
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: Color(0xff021526), width: 1.5),
      ),
      dialBackgroundColor: Colors.white,
      dialHandColor: Color(0xff021526),
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
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

    chipTheme: ChipThemeData(
      selectedColor: Color(0xff021526),
      backgroundColor: Color(0xffFFFFFF),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff021526),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white,
      selectionHandleColor: Colors.white,
    ),

    colorScheme: ColorScheme.dark(
      primary: Color(0xffFFFFFF),
      secondary: Color(0xff021526),
      onPrimary: Color(0xffFFEDD5),
      onSecondary: Color(0xffC2410C),
      tertiary: Color(0xffFBBF24),
      onTertiary: Color(0xff78350F),
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
      errorStyle: TextStyle(color: Colors.red),
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
      todayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xff021526);
        }
        return Colors.white;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        }
        return Colors.white;
      }),
    ),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Color(0xff021526),
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: Colors.white, width: 1.5),
      ),
      dialBackgroundColor: Color(0xff021526),
      dialHandColor: Colors.white,
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
      dayPeriodColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Colors.white;
        } else {
          return Color(0xff021526);
        }
      }),

      dayPeriodTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return Color(0xff021526);
        } else {
          return Colors.white;
        }
      }),
    ),

    chipTheme: ChipThemeData(
      selectedColor: Color(0xffFFFFFF),
      backgroundColor: Color(0xff021526),
    ),
  );
}
