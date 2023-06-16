class PokemonItem {
  String? number;
  String? name;
  String? species;
  String? sprite;

  PokemonItem({this.number, this.name, this.species, this.sprite});

  PokemonItem.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    species = json['species'];
    sprite = json['sprite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = number;
    data['name'] = name;
    data['species'] = species;
    data['sprite'] = sprite;
    return data;
  }
}