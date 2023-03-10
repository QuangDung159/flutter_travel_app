import 'dart:io';

import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  static String clientId = Platform.isIOS
      ? '1012509086997-5595hcq0p2gnmi5m5bqoqjrictle7bef.apps.googleusercontent.com'
      : '';

  static final googleInfo = Get.put(GetxGoogleInfoController());

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static Future<GoogleSignInAccount?> login() async {
    try {
      var res = await _googleSignIn.signIn();
      if (res != null) {
        googleInfo.setData(
          photoUrl: res.photoUrl,
          email: res.email,
          openid: res.id,
          displayName: res.displayName,
        );

        LocalStorageHelper.setValue('PHOTO_URL', res.photoUrl);
        LocalStorageHelper.setValue('EMAIL', res.email);
        LocalStorageHelper.setValue('DISPLAY_NAME', res.displayName);
        LocalStorageHelper.setValue('OPEN_ID', res.id);
      }
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future logout() async {
    try {
      googleInfo.setData(
        photoUrl: '',
        email: '',
        openid: '',
        displayName: '',
      );

      LocalStorageHelper.setValue('PHOTO_URL', '');
      LocalStorageHelper.setValue('EMAIL', '');
      LocalStorageHelper.setValue('DISPLAY_NAME', '');
      LocalStorageHelper.setValue('OPEN_ID', '');
      _googleSignIn.disconnect();
    } catch (e) {
      throw Exception(e);
    }
  }
}
