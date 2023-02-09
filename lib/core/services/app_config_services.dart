import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_travel_app/core/Controllers/getx_app_config_controller.dart';
import 'package:flutter_travel_app/core/constants/common_constant.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AppConfigServices {
  static Future<String> fetchApkDownloadUrl() async {
    try {
      final res =
          await http.get(Uri.parse('$baseUrl/app-config/apk-download-url'));
      if (res.statusCode == 200) {
        String downloadUrl = json.decode(res.body)['data']['downloadUrl'];
        return downloadUrl;
      }
      throw Exception('Fail to fetch list photo');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    GetxAppConfigController appConfigController =
        Get.put(GetxAppConfigController());

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 2),
    ));
    RemoteConfigValue(null, ValueSource.valueStatic);
    await remoteConfig.fetchAndActivate();

    appConfigController.setData(
      apkDownloadUrl: remoteConfig.getString('apk_download_url'),
      appVersionCode: remoteConfig.getString('app_version_code'),
      appVersionName: remoteConfig.getString('app_version_name'),
    );

    printCustom(
        title: 'remoteConfig :>>',
        content: remoteConfig.getString('apk_download_url'));
    return remoteConfig;
  }
}
