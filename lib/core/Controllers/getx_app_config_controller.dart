import 'package:get/get.dart';

class GetxAppConfigController extends GetxController {
  RxString apkDownloadUrl = ''.obs;
  RxString appVersionName = ''.obs;
  RxString appVersionCode = ''.obs;

  void setData({
    String? apkDownloadUrl,
    String? appVersionName,
    String? appVersionCode,
  }) {
    if (apkDownloadUrl != null) {
      this.apkDownloadUrl.value = apkDownloadUrl;
    }

    if (appVersionName != null) {
      this.appVersionName.value = appVersionName;
    }

    if (appVersionCode != null) {
      this.appVersionCode.value = appVersionCode;
    }
  }
}
