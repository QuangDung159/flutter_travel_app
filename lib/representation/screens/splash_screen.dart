import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/getx_app_config_controller.dart';
import 'package:flutter_travel_app/core/helpers/asset_helper.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';
import 'package:flutter_travel_app/core/helpers/image_helper.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_travel_app/representation/screens/intro_screen.dart';
import 'package:flutter_travel_app/representation/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routerName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  OtaEvent? currentEvent;
  bool needUpdate = false;
  GetxAppConfigController appConfigController =
      Get.find<GetxAppConfigController>();

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') ?? false;

    await Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (ignoreIntroScreen)
          {
            Navigator.of(context).pushReplacementNamed(
              MainScreen.routerName,
            ),
          }
        else
          {
            Navigator.of(context).pushReplacementNamed(
              IntroScreen.routerName,
            )
          }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // redirectIntroScreen();

    // AppConfigServices.fetchApkDownloadUrl()
    //     .then((value) => tryOtaUpdate(value));

    // checkoutRequireUpdate();
  }

  Future<void> checkoutRequireUpdate() async {
    var apkDownloadUrl = appConfigController.apkDownloadUrl.value;
    var appVersionName = appConfigController.appVersionName.value;
    var appVersionCode = appConfigController.appVersionCode.value;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    printCustom(title: 'version :>>', content: version);
    printCustom(title: 'appVersionName :>>', content: appVersionName);

    if (version != appVersionName) {
      return;
    }

    if (buildNumber == appVersionCode) {
      return;
    }

    printCustom(title: 'apkDownloadUrl :>>', content: apkDownloadUrl);

    // tryOtaUpdate(apkDownloadUrl);
  }

  Future<void> tryOtaUpdate(String apkUrl) async {
    try {
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      printCustom(title: 'apkUrl :>>', content: apkUrl);
      OtaUpdate()
          .execute(
        apkUrl,
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageHelper.loadFromAsset(
          AssetHelper.imageBackgroundSplash,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        ImageHelper.loadFromAsset(
          AssetHelper.imageCircleSplash,
          width: MediaQuery.of(context).size.width,
        ),
        // renderUpdateProgress(context),
        Obx(
          () => renderUpdateProgress(context),
        ),
      ],
    );
  }

  Widget renderUpdateProgress(BuildContext context) {
    checkoutRequireUpdate();
    return Positioned(
      top: MediaQuery.of(context).size.height / 2 + 50,
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'OTA status: ${currentEvent != null ? currentEvent?.status : ''} : ${currentEvent != null ? currentEvent!.value : ''} \n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              'Test',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
