import 'package:cars_project/api/constants/constants.dart';

class PokemonResponse {
  late bool isLastPage;
  late List<Pokemon> pokemonList;

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    isLastPage = json['next'] == null;
    pokemonList = _mapPokemonResponseToList(json);
  }

  List<Pokemon> _mapPokemonResponseToList(Map<String, dynamic> json)  {
    return json["results"].map<Pokemon>((pokemonJson) => Pokemon.fromJson(pokemonJson)).toList();
  }

  @override
  String toString() {
    return 'PokemonResponse{isLastPage: $isLastPage, pokemonList: $pokemonList}';
  }
}


class Pokemon {
  late String id;
  late String name;
  late String url;
  late String sprite;

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    id = _getPokemonIdOfUrl();
    sprite = Constants.getSpriteUrl(id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  String _getPokemonIdOfUrl() {
    var segments = Uri.parse(url).pathSegments;
    return segments.elementAt(segments.length - 2);
  }

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, url: $url, sprite: $sprite}';
  }
}