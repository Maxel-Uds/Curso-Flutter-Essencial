class PokemonItem {
  int? baseExperience;
  int? height;
  int? id;
  String? sprite;
  List<Types>? types;
  int? weight;

  PokemonItem(
      {this.baseExperience,
        this.height,
        this.id,
        this.sprite,
        this.types,
        this.weight});

  PokemonItem.fromJson(Map<String, dynamic> json) {
    baseExperience = json['base_experience'];
    height = json['height'];
    id = json['id'];
    sprite = json['sprite'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['id'] = id;
    data['sprite'] = sprite;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class Types {
  Type? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type {
  String? name;

  Type({this.name});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}