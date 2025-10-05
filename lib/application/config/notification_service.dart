import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    try {
      tzdata.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));

      const androidInitializationSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      const iosInitializationSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
      );

      const initializationSettings = InitializationSettings(
        iOS: iosInitializationSettings,
        android: androidInitializationSettings,
      );

      await _notifications.initialize(initializationSettings);

      final androidPlugin =
          _notifications
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      if (androidPlugin != null) {
        await androidPlugin.requestNotificationsPermission();
      }

      final iosPlugin =
          _notifications
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >();
      if (iosPlugin != null) {
        await iosPlugin.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
          critical: true,
        );
      }
    } catch (e) {
      debugPrint('通知の初期化に失敗: $e');
    }
  }

  Future<void> scheduleNotification(
    int id,
    DateTime scheduledAt,
    int beforeMinuit,
    String title,
  ) async {
    try {
      //var scheduledDate = tz.TZDateTime.from(scheduledTime, tz.local);
      var remindAt = tz.TZDateTime.from(scheduledAt, tz.local);
      remindAt = remindAt.subtract(Duration(minutes: beforeMinuit));

      // if (remindAt.isBefore(tz.TZDateTime.now(tz.local))) {
      //   remindAt = remindAt.add(const Duration(seconds: 3));
      // }

      await _notifications.zonedSchedule(
        id,
        '🔔',
        title,
        remindAt,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'notification_channel_id',
            'Notification Channel',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            icon: null,
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: 'default',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('通知を設定しました$remindAt');
    } catch (e) {
      debugPrint('通知のスケジュールに失敗しました: $e');
      rethrow;
    }
  }

  Future<void> multiCancelNotifications(List<int> idList) async {
    try {
      for (final id in idList) {
        await _notifications.cancel(id);
      }
      debugPrint('全ての通知をキャンセルしました');
    } catch (e) {
      debugPrint('通知のキャンセルに失敗: $e');
      rethrow;
    }
  }

  Future<void> cancelNotifications(int id) async {
    try {
      await _notifications.cancel(id);
    } catch (e) {
      debugPrint('通知のキャンセルに失敗: $e');
      rethrow;
    }
  }
}
