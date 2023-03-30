import 'dart:developer';

import 'package:api_fetch_own/constant/urls.dart';
import 'package:api_fetch_own/model/user_data.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<Getuser?> getapi() async {
    try {
      var url = Uri.parse(Api.baseurl);
      var responce = await http.get(url);
      log(responce.body);

      if (responce.statusCode == 200) {
        Getuser model = getuserFromJson(responce.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
