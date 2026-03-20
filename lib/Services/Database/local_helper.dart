import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  Future<void> setLocale(String locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', locale);
  }

  Future<String?> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('locale');
  }

  Future<void> clearLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('locale');
  }
}
