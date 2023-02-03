import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static Future<void> showNotification({
    String? title,
    String? body,
    String? soundName,
    String? payload,
    bool? usingCustomSound = false,
    Duration? duration,
  }) async {
    bool isPlayCustomSound = usingCustomSound != null && usingCustomSound;

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      sound: isPlayCustomSound
          ? RawResourceAndroidNotificationSound('slow_spring_board')
          : null,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    if (isPlayCustomSound) {
      DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(sound: 'slow_spring_board.aiff');

      final LinuxNotificationDetails linuxPlatformChannelSpecifics =
          LinuxNotificationDetails(
        sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
      );

      notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
        macOS: darwinNotificationDetails,
        linux: linuxPlatformChannelSpecifics,
      );
    }

    if (duration != null) {
      await zonedSchedule(
        title: title,
        body: body,
        duration: duration,
        notificationDetails: notificationDetails,
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        id++,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
    }
  }

  static Future<void> zonedSchedule({
    String? title,
    String? body,
    String? payload,
    required Duration duration,
    required NotificationDetails notificationDetails,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id++,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  static Future<void> repeatNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'repeating channel id', 'repeating channel name',
            channelDescription: 'repeating description');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id++,
        'repeating title',
        'repeating body',
        RepeatInterval.everyMinute,
        notificationDetails,
        androidAllowWhileIdle: true);
  }
}
