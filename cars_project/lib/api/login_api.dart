import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String pass, String username) async {
    var response = await http.get('https://pokeapi.co/api/v2/pokemon/1');
    return response.statusCode == 200;
  }
}
