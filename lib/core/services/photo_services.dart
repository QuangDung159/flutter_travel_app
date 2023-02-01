import 'dart:convert';

import 'package:flutter_travel_app/core/constants/common_constant.dart';
import 'package:flutter_travel_app/data/models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoServices {
  static Future<List<PhotoModel>> fetchListPhoto() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/photo'));
      if (res.statusCode == 200) {
        Iterable list = json.decode(res.body)['data']['photos'];
        List<PhotoModel> listPhoto = List<PhotoModel>.from(
          list.map(
            (e) => PhotoModel.fromJson(e),
          ),
        );
        return listPhoto;
      }
      throw Exception('Fail to fetch list photo');
    } catch (e) {
      throw Exception(e);
    }
  }
}
