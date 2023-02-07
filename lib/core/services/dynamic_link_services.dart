import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';

class DynamicLinkServices {
  static Future<void> initDynamicLinks({
    required FirebaseDynamicLinks dynamicLinks,
    required BuildContext context,
  }) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      printCustom(title: 'dynamicLinkData', content: dynamicLinkData);
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }
}
