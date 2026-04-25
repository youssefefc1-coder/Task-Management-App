import 'package:flutter/material.dart';
import 'package:task_management_app/Services/Database/theme_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;
    ThemeHelper().setThemeMode(mode.name);
    notifyListeners();
  }

  Future<void> getTheme() async {
    String? mode = await ThemeHelper().getThemeMode();
    _themeMode = ThemeMode.values.byName(mode ?? 'system');
    notifyListeners();
  }
}
