import 'dart:convert';

import 'package:cars_project/model/login_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<LoginResponse> login(String pass, String username) async {
    var response = await http.get('https://pokeapi.co/api/v2/pokemon/1');
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}
