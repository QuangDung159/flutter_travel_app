// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/data/models/received_notification_model.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';
import 'package:flutter_travel_app/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final StreamController<ReceivedNotificationModel>
    didReceiveLocalNotificationStream =
    StreamController<ReceivedNotificationModel>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

String? selectedNotificationPayload;

const String urlLaunchActionId = 'id_1';

const String navigationActionId = 'id_3';

const String darwinNotificationCategoryText = 'textCategory';

const String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorage();
  // LocalStorageHelper.setValue('ignoreIntroScreen', false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetxGoogleInfoController googleInfo = Get.put(GetxGoogleInfoController());

    var displayName = LocalStorageHelper.getValue('DISPLAY_NAME');

    if (displayName != null && displayName != '') {
      googleInfo.setData(
        displayName: displayName,
        photoUrl: LocalStorageHelper.getValue('PHOTO_URL'),
        openid: LocalStorageHelper.getValue('OPEN_ID'),
        email: LocalStorageHelper.getValue('EMAIL'),
      );
    }

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: const Text(
          'Flutter Travel',
        ),
      ),
    );
  }
}
