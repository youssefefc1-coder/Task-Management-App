import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  Future<void> setThemeMode(String mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', mode);
  }

  Future<String?> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme');
  }
}
