import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/path.dart';

class CustomHttp {
  dynamic getRequest({String path, String token}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response =
          await http.get('$BASE_URL$path', headers: headers);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic postRequest({String path, String body, String token}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(
        '$BASE_URL$path',
        body: body,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
