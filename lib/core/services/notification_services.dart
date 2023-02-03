import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static tz.TZDateTime _nextInstanceOfTenAMLastYear() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    return tz.TZDateTime(tz.local, now.year - 1, now.month, now.day, 10);
  }

  static tz.TZDateTime _nextInstanceOfMondayTenAM() {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
    while (scheduledDate.weekday != DateTime.monday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

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

  static Future<void> scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  /// To test we don't validate past dates when using `matchDateTimeComponents`
  static Future<void> scheduleDailyTenAMLastYearNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAMLastYear(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static Future<void> scheduleWeeklyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'weekly scheduled notification title',
        'weekly scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails('weekly notification channel id',
              'weekly notification channel name',
              channelDescription: 'weekly notificationdescription'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }
}
