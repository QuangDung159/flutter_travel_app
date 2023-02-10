// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/core/services/app_config_services.dart';
import 'package:flutter_travel_app/core/services/dynamic_link_services.dart';
import 'package:flutter_travel_app/core/services/notification_services.dart';
import 'package:flutter_travel_app/data/models/received_notification_model.dart';
import 'package:flutter_travel_app/representation/screens/splash_screen.dart';
import 'package:flutter_travel_app/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotificationModel>
    didReceiveLocalNotificationStream =
    StreamController<ReceivedNotificationModel>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

Future<void> main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorage();
  await Firebase.initializeApp();
  // LocalStorageHelper.setValue('ignoreIntroScreen', false);

  // start local notification
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  InitializationSettings initializationSettings =
      await NotificationServices.initializeLocalNotificationSettings();

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );
  // end local notification

  // start firebase notification
  String? token = await FirebaseMessaging.instance.getToken();
  printCustom(title: 'fcm token :>>', content: token);

  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    RemoteNotification? notification = remoteMessage.notification;
    // AndroidNotification? android = remoteMessage.notification?.android;

    if (notification != null) {
      NotificationServices.showNotification(
        title: notification.title,
        body: notification.body,
        usingCustomSound: true,
        payload: remoteMessage.data['payload'],
      );
    }
  });

  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _notificationsEnabled = false;

  // String? _linkMessage;
  // // bool _isCreatingLink = false;
  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  // final String _testString =
  //     'To test: long press link and then copy and click from a non-browser '
  //     "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
  //     'is properly setup. Look at firebase_dynamic_links/README.md for more '
  //     'details.';

  // final String DynamicLink = 'https://example/helloworld';
  // final String Link = 'https://flutterfiretests.page.link/MEGs';

  @override
  void initState() {
    super.initState();

    _isAndroidPermissionGranted();
    _requestPermissions();
    // NotificationServices.configureDidReceiveLocalNotificationSubject(context);

    // local notification onTap
    NotificationServices.onTapLocalNotification();

    // firebase notification onTap
    NotificationServices.setupInteractedFirebaseMessage();

    DynamicLinkServices.onReceiveTerminateAppDynamicLink();
    DynamicLinkServices.onReceiveDynamicLink();

    // DynamicLinkServices.initDynamicLinks(
    //   dynamicLinks: dynamicLinks,
    //   context: context,
    // );

    AppConfigServices.setupRemoteConfig();
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      setState(() {
        _notificationsEnabled = granted ?? false;
      });
    }
  }

  @override
  void dispose() {
    didReceiveLocalNotificationStream.close();
    selectNotificationStream.close();
    super.dispose();
  }

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
