import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz_data.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(settings: settings);

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static NotificationDetails _notificationDetails({
    required String channelId,
    required String channelName,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
    );
  }

  static Future<void> scheduleDeadlineAlert(TaskModel task) async {
    if (task.deadline == null || task.id == null) return;

    final alertTime = task.deadline!.subtract(const Duration(minutes: 30));

    if (alertTime.isBefore(DateTime.now())) return;

    await _plugin.zonedSchedule(
      id: _deadlineNotifId(task.id!),
      title: '⏰ Deadline in 30 minutes',
      body: '"${task.title}" is due soon!',
      scheduledDate: tz.TZDateTime.from(alertTime, tz.local),
      notificationDetails: _notificationDetails(
        channelId: 'deadline_channel',
        channelName: 'Deadline Alerts',
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelTaskNotifications(String taskId) async {
    await _plugin.cancel(id: _deadlineNotifId(taskId));
    await _plugin.cancel(id: _reminderNotifId(taskId));
  }

  static int _deadlineNotifId(String taskId) => taskId.hashCode & 0x7FFFFFFF;

  static int _reminderNotifId(String taskId) =>
      ("$taskId _reminder").hashCode & 0x7FFFFFFF;
}
