import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/main.dart';

class NotificationServices {
  static Future<void> showNotification({
    String? title,
    String? body,
    String? soundName,
    String? payload,
    bool? usingCustomSound = false,
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

    if (isPlayCustomSound) {
      DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(sound: 'slow_spring_board.aiff');

      final LinuxNotificationDetails linuxPlatformChannelSpecifics =
          LinuxNotificationDetails(
        sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
        macOS: darwinNotificationDetails,
        linux: linuxPlatformChannelSpecifics,
      );

      await flutterLocalNotificationsPlugin.show(
        id++,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
    } else {
      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.show(
        id++,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
    }
  }
}
