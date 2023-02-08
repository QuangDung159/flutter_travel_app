// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/core/services/dynamic_link_services.dart';
import 'package:flutter_travel_app/core/services/notification_services.dart';
import 'package:flutter_travel_app/data/models/received_notification_model.dart';
import 'package:flutter_travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:flutter_travel_app/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ota_update/ota_update.dart';

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

  await NotificationServices.configureLocalTimeZone();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  String initialRoute = MainScreen.routerName;

  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    selectedNotificationPayload =
        notificationAppLaunchDetails!.notificationResponse?.payload;
    initialRoute = HotelBookingScreen.routerName;
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final List<DarwinNotificationCategory> darwinNotificationCategories =
      <DarwinNotificationCategory>[
    DarwinNotificationCategory(
      darwinNotificationCategoryText,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.text(
          'text_1',
          'Action 1',
          buttonTitle: 'Send',
          placeholder: 'Placeholder',
        ),
      ],
    ),
    DarwinNotificationCategory(
      darwinNotificationCategoryPlain,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.plain('id_1', 'Action 1'),
        DarwinNotificationAction.plain(
          'id_2',
          'Action 2 (destructive)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.destructive,
          },
        ),
        DarwinNotificationAction.plain(
          navigationActionId,
          'Action 3 (foreground)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.foreground,
          },
        ),
        DarwinNotificationAction.plain(
          'id_4',
          'Action 4 (auth required)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.authenticationRequired,
          },
        ),
      ],
      options: <DarwinNotificationCategoryOption>{
        DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
      },
    )
  ];

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotificationModel(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
    notificationCategories: darwinNotificationCategories,
  );

  final LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(
    defaultActionName: 'Open notification',
    defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
  );

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
  print(token);

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
  OtaEvent? currentEvent;

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
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();

    setupInteractedMessage();

    DynamicLinkServices.onReceiveTerminateAppDynamicLink(context);
    DynamicLinkServices.onReceiveDynamicLink(context);

    // DynamicLinkServices.initDynamicLinks(
    //   dynamicLinks: dynamicLinks,
    //   context: context,
    // );

    tryOtaUpdate();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) async {
    if (message.data['payload'] == null || message.data['payload'] == '') {
      return;
    }

    await Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          navigationByRouterName(message.data['payload']),
    ));
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

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotificationModel receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HotelBookingScreen(),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => navigationByRouterName(payload),
      ));
    });
  }

  Future<void> tryOtaUpdate() async {
    try {
      String apkLink = 'https://doc-08-3o-docs.googleusercontent.com/docs/securesc/af5kce5kl7le6v84mk14ss6cob2qc8k9/dh5mcpciivkk7r0i9cl5ifnl4gfe5heo/1675847475000/05611245833157123706/05611245833157123706/1WLK1lt4Xr2Cisl1vrHlu0uxBnBizJ6cZ?e=download&ax=AB85Z1CRZWYulet_eI5DdDF64KpFGJhBeti54nQJjJHE5sSoetpJhLXgrETy4a5I2KQ5gjAQ6iJpgP-JMFFT5sKQooU_PRE3DROf9iWFDnle7WRArCx7AupcEisTXdBWr1ZoZIntr4EbZ89y_Ay60mBg4d31hfh1ZgDXDP6UqVxrgKk48aUD3CYPKBmvwPufxSfeqK7J4ur-rOY-Nz0I-CDVGV3E3icycHV5pcsUtOyuFburk1Z3IrgNq8m2iy3i_h103LolVhAENB5NHml6NA1_LSi8wS89ImisN8dyvPg1Hj-nuvD6ZRq_9Mjg7MQKAfkETtYjkrjc8Uu4oHBW624l0IOfT7jVuDWvL0Dp9Y1rHjWPSAlh3HmMpGx3a_dFPLLxjNTFUmJrta9DZ9RhhKguALelPFxQJ-KDU41GjvqXGHc_Vl4GiVm7bULf3_tbPBiijZSCf1Occ_UemEYQZkcJDbudziDmfUMw7fcyGYbCf9ml_QhDb9vujTQu7VzUIS8gRZGZgnRp919epHPY6JwK6akb5qTptyovvskG-U86NcZdzdwi6bbm9tN5yiD9LVSJsNf9gH75KlDQR3BmJ6ApnmT-LfY-x8E7vg7Tb3Xjvo8WEaell8z21pe5mVnsNJ0cXJRTk2oQ_Jmlq3KOjjA2n7qfNg5jAa7HsOxuAsI_fnUJaIsKDOMZBIRHLiMAr0EaZbvAKTdsD7xyTO0iwZhIwsL6HfE4WqbUv1sFbWp-_CFrQJ8uenlpKbAX3c889y-Fp2bTEasYqdlsn6LWCylnYPzpmT9xq_yAAVgjZsGgZjWuzq0WknFvqIo6uVoIY_-kbEW1_CVIL5xGaKRZuuInt9LnwflwAqBybFn1GhUmXrc-X9EHp063L2kTGM4_6NrcujuUx6c6KTcDAWDzbQ7nzhq0rkoRWvqPICKdJ0OYHke61hRdR4-x0hEERYJVy2yTDYTWlVtYpFGH2FxXNL1DKAB6o2bG5zANKPzfAn81YAeutUrUpO2MAZVpI-ZAhPmSB3Do5_xIrrrJYEUo&uuid=9e785398-bdde-460d-b88d-440c0b0f265b&authuser=0&nonce=rch0pu2ihpmic&user=05611245833157123706&hash=8km659b83u5olomrjeqsdg26591tvhkj';
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      OtaUpdate()
          .execute(
        apkLink,
        destinationFilename: 'flutter-travel-app.apk',
        //FOR NOW ANDROID ONLY - ABILITY TO VALIDATE CHECKSUM OF FILE:
        // sha256checksum:
        //     'd6da28451a1e15cf7a75f2c3f151befad3b80ad0bb232ab15c20897e54f21478',
      )
          .listen(
        (OtaEvent event) {
          setState(() => currentEvent = event);
        },
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
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
      // home: SplashScreen(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'OTA status: ${currentEvent != null ? currentEvent?.status : ''} : ${currentEvent != null ? currentEvent!.value : ''} \n',
              ),
              Text(
                'Test 1',
              ),
            ],
          ),
        ),
      ),
      routes: routes,
    );
  }
}
