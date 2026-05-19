import 'package:shared_preferences/shared_preferences.dart';

class NotificationHelper {
  Future<void> setNotificationState(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notification', state);
  }

  Future<bool?> getNotificationState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notification');
  }
}
