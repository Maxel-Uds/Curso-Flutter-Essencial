import 'dart:convert';
import 'package:cars_project/model/pokemon_item.dart';
import 'package:cars_project/model/pokemon_response.dart';
import 'package:http/http.dart' as http;

class PokemonApi {
  static List<PokemonResponse> getPokemonList()  {
    try {
      // var response = await http.get('https://pokeapi.co/api/v2/pokemon');

      // if(response.statusCode == 200) return ApiResponse.ok(_mapPokemonResponseToList(jsonDecode(response.body)));

      // return ApiResponse.error("Mensagem de erro do response");

      return List.of([]);
    } catch(error, exception) {
      // return ApiResponse.error("Erro no serviço de login. Erro $error");
      return List.of([]);
    }
  }

  static List<PokemonItem> getPokemon(String name) {
    try {
        // var response = await http.get("https://pokeapi.co/api/v2/pokemon/$name");
        //
        // if(response.statusCode == 200) return ApiResponse.ok(PokemonItem.fromJson(jsonDecode(response.body)));
        //
        // return ApiResponse.error("Mensagem de erro do response");

      //URL do sprite varia apenas o id do pokemon.
      return List.of(
        [
          PokemonItem(name: "Bulbasaur", sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
          PokemonItem(name: "Ivysaur", sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png"),
        ]
      );
    } catch(error, exception) {
      // return ApiResponse.error("Erro no serviço de login. Erro $error");
      return List.of([]);
    }
  }

  static _mapPokemonResponseToList(Map<String, dynamic> json)  {
    return json["results"].map<PokemonResponse>((pokemonJson) => PokemonResponse.fromJson(pokemonJson)).toList();
  }
}