import 'dart:convert';

import 'package:flutter_travel_app/core/constants/common_constant.dart';
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
}
