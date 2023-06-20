import 'dart:convert';

import 'package:cars_project/model/api_response.dart';
import 'package:cars_project/model/login_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<LoginResponse>> login(String pass, String username) async {
    try {
      var response = await http.get('https://pokeapi.co/api/v2/pokemon/2');

      if(pass.length < 10 && response.statusCode == 200) {
        var user = LoginResponse.fromJson(jsonDecode(response.body));
        user.save();
        return ApiResponse.ok(user);
      }

      return ApiResponse.error("Mensagem de erro do response");
    } catch(error, exception) {
      return ApiResponse.error("Erro no serviço de login. Erro $error, Exception: $exception");
    }
  }
}
