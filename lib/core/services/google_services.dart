import 'dart:io';

import 'package:flutter_travel_app/core/Controllers/getx_google_info_controller.dart';
import 'package:flutter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  static String clientId = Platform.isIOS
      ? '1012509086997-2im2b2osa16vvmidoqop8g4b40ffer24.apps.googleusercontent.com'
      : '';

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static Future<GoogleSignInAccount?> login() async {
    try {
      var res = await _googleSignIn.signIn();
      if (res != null) {
        final googleInfo = Get.put(GetxGoogleInfoController());

        print('res.photoUrl: ${res.photoUrl}');

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

  static Future logout() async => _googleSignIn.disconnect();
}
