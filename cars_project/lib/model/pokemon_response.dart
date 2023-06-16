class PokemonResponse {
  String? name;
  String? url;

  PokemonResponse({this.name, this.url});

  PokemonResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}