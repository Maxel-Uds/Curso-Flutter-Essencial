import 'package:cars_project/api/constants/constants.dart';

class PokemonResponse {
  late String id;
  late String name;
  late String url;
  late String sprite;

  PokemonResponse.fromJson(Map<String, dynamic> json) {
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
    return 'PokemonResponse{id: $id, name: $name, url: $url, sprite: $sprite}';
  }
}