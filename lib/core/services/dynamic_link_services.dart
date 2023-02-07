import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/helpers/common_helper.dart';

class DynamicLinkServices {
  static Future<void> initDynamicLinks({
    required FirebaseDynamicLinks dynamicLinks,
    required BuildContext context,
  }) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  static onReceiveDynamicLink(BuildContext context) {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      printCustom(title: 'dynamicLinkData :>>', content: dynamicLinkData);
      handleDynamicUrl(dynamicLinkData.link.toString(), context);
    }).onError((error) {
      throw Exception(error);
    });
  }

  static onReceiveTerminateAppDynamicLink(BuildContext context) async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      handleDynamicUrl(initialLink.link.toString(), context);
    }
  }

  static handleDynamicUrl(String url, BuildContext context) async {
    List<Map<String, String>> params = getParamsFromUrl(url);

    var routerName = '';
    var title = '';

    params.forEach((element) {
      if (element['key'] == 'routerName') {
        routerName = element['value'].toString();
      }

      if (element['key'] == 'title') {
        title = element['value'].toString();
      }
    });

    await Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          navigationByRouterName('/${routerName}'),
    ));
  }

  static getParamsFromUrl(String url) {
    List<String> urlArr = url.split('?');
    List<String> urlArr2 = urlArr[1].split('&');
    var list = urlArr2.map(
      (e) => <String, String>{'key': e.split('=')[0], 'value': e.split('=')[1]},
    );

    return list.toList();
  }
}
