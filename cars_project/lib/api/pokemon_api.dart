import 'dart:convert';
import 'package:cars_project/api/constants/constants.dart';
import 'package:cars_project/model/api_response.dart';
import 'package:cars_project/model/pokemon_item.dart';
import 'package:cars_project/model/pokemon_response.dart';
import 'package:http/http.dart' as http;

class Letter {
  static const A = "a";
  static const B = "b";
  static const C = "c";
  static const D = "d";
}

class PokemonApi {

  static Future<ApiResponse<PokemonResponse>> getPokemonList(int offset) async {
    try {
      var response = await http.get(Uri.parse("${Constants.POKE_API_URL}?limit=10&offset=$offset"));

      if(response.statusCode == 200) return ApiResponse.ok(PokemonResponse.fromJson(jsonDecode(response.body)));

      return ApiResponse.error("Mensagem de erro do response");
    } catch(error, exception) {
      return ApiResponse.error("Erro no serviço de login. Erro $error");
    }
  }

  static Future<ApiResponse<PokemonItem>> getPokemonByName(String name) async {
    try {
        var response = await http.get("${Constants.POKE_API_URL}/$name");

        if(response.statusCode == 200) return ApiResponse.ok(PokemonItem.fromJson(jsonDecode(response.body)));

        return ApiResponse.error("Mensagem de erro do response");
    } catch(error, exception) {
      return ApiResponse.error("Erro no serviço de login. Erro $error");
    }
  }
}