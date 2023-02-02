import 'package:get/get.dart';

class GetxGoogleInfoController extends GetxController {
  RxString photoUrl = ''.obs;
  RxString email = ''.obs;
  RxString openid = ''.obs;
  RxString displayName = ''.obs;

  void setData({
    String? photoUrl,
    String? email,
    String? openid,
    String? displayName,
  }) {
    if (photoUrl != null) {
      this.photoUrl.value = photoUrl;
    }

    if (email != null) {
      this.email.value = email;
    }

    if (displayName != null) {
      this.displayName.value = displayName;
    }

    if (openid != null) {
      this.openid.value = openid;
    }
  }
}
