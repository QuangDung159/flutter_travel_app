import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  static String clientId = Platform.isIOS ? '' : '';

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static Future<GoogleSignInAccount?> login() async {
    return _googleSignIn.signIn();
  }

  static Future logout() async => _googleSignIn.disconnect();
}
