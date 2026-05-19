import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_management_app/Model/task_model.dart' hide Priority;
import 'package:task_management_app/generated/l10n.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz_data.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await plugin.initialize(settings: settings);

    await plugin
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

    final alertTime = task.deadline!.subtract(const Duration(hours: 1));

    if (alertTime.isBefore(DateTime.now())) return;

    await plugin.zonedSchedule(
      id: _deadlineNotifId(task.id!),
      title: S.current.task_notification_title,
      body: '"${task.title}" ${S.current.task_notification_body}',
      scheduledDate: tz.TZDateTime.from(alertTime, tz.local),
      notificationDetails: _notificationDetails(
        channelId: 'deadline_channel',
        channelName: 'Deadline Alerts',
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelTaskNotifications(String taskId) async {
    await plugin.cancel(id: _deadlineNotifId(taskId));
  }

  static Future<void> cancelAllNotifications() async {
    await plugin.cancelAll();
  }

  static int _deadlineNotifId(String taskId) => taskId.hashCode & 0x7FFFFFFF;
}
