import 'package:flutter/material.dart';
import 'package:task_management_app/Theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.secondaryColor,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.primaryColor.withValues(alpha: 0.4),
      suffixIconColor: AppColors.primaryColor.withValues(alpha: 0.4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      errorStyle: TextStyle(color: AppColors.errorColor),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.secondaryColor,
      headerBackgroundColor: AppColors.secondaryColor,
      headerForegroundColor: AppColors.primaryColor,
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return Colors.transparent;
        }
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
    ),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.secondaryColor,
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.primaryColor),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.primaryColor),
        ),
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.secondaryColor;
        }
      }),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      dialBackgroundColor: AppColors.secondaryColor,
      dialHandColor: AppColors.primaryColor,
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
      dayPeriodColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.secondaryColor;
        }
      }),

      dayPeriodTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
    ),

    chipTheme: ChipThemeData(
      selectedColor: AppColors.primaryColor,
      backgroundColor: AppColors.secondaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.secondaryColor,
      selectionColor: AppColors.secondaryColor,
      selectionHandleColor: AppColors.secondaryColor,
    ),

    colorScheme: ColorScheme.dark(
      primary: AppColors.secondaryColor,
      secondary: AppColors.primaryColor,
      onPrimary: Color(0xffFFEDD5),
      onSecondary: AppColors.onSecondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.secondaryColor.withValues(alpha: 0.4),
      suffixIconColor: AppColors.secondaryColor.withValues(alpha: 0.4),
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
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      errorStyle: TextStyle(color: AppColors.errorColor),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.primaryColor,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: AppColors.secondaryColor,
      dayBackgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
      todayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.secondaryColor;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.secondaryColor;
      }),
    ),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.primaryColor,
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.secondaryColor),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: AppColors.secondaryColor),
        ),
      ),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.secondaryColor;
        }
      }),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: AppColors.secondaryColor, width: 1.5),
      ),
      dialBackgroundColor: AppColors.primaryColor,
      dialHandColor: AppColors.secondaryColor,
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.secondaryColor;
        }
      }),
      dayPeriodColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.secondaryColor;
        } else {
          return AppColors.primaryColor;
        }
      }),

      dayPeriodTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        } else {
          return AppColors.secondaryColor;
        }
      }),
    ),

    chipTheme: ChipThemeData(
      selectedColor: AppColors.secondaryColor,
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
