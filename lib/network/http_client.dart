import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/models/user.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();
  static HttpClient get instance => _singleton;

  Future<dynamic> getUsers(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception();
      } else {
        final decodedJson = json.decode(response.body);
        final users = List<User>.from(decodedJson.map((x) => User.fromJson(x)));
        return users;
      }
    } catch (error) {
      print(error);
    }
  }
}
