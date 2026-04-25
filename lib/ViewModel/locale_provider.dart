import 'package:flutter/material.dart';
import 'package:task_management_app/Services/Database/locale_helper.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  LocalHelper prefs = LocalHelper();

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await prefs.setLocale(locale.languageCode);
    notifyListeners();
  }

  Future<void> getLocale() async {
    final code = await prefs.getLocale();

    if (code != null) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Future<void> clearLocale() async {
    _locale = null;
    await prefs.clearLocale();
    notifyListeners();
  }
}
