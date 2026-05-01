import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/Database/notification_helper.dart';
import 'package:task_management_app/Services/notification_service.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isEnabled = true;

  bool get isEnabled => _isEnabled;

  Future<void> loadNotificationState() async {
    final saveSate = await NotificationHelper().getNotificationSate() ?? true;

    final androidPlugin = NotificationService.plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    final onGranted = await androidPlugin?.areNotificationsEnabled() ?? false;

    _isEnabled = saveSate && onGranted;

    notifyListeners();
  }

  Future<void> disableNotification() async {
    await NotificationHelper().setNotificationState(false);
    await NotificationService.cancelAllNotifications();
    _isEnabled = false;
    notifyListeners();
  }

  Future<void> enableNotification(List<TaskModel> tasks) async {
    final androidPlugin = NotificationService.plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    final granted = await androidPlugin?.areNotificationsEnabled() ?? false;

    if (!granted) {
      final result = await androidPlugin?.requestNotificationsPermission();
      if (result != true) {
        AppSettings.openAppSettings();
        return;
      }
    }

    await NotificationHelper().setNotificationState(true);

    for (TaskModel task in tasks) {
      await NotificationService.scheduleDeadlineAlert(task);
    }

    _isEnabled = true;
    notifyListeners();
  }
}
