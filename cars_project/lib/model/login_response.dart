import 'package:cars_project/utils/preferences.dart';
import 'dart:convert' as convert;

import 'login_response_list.dart';

class LoginResponse {
  late int id;
  late String name;
  late int order;
  late int height;
  late int weight;
  late List<LoginResponseList> list;

  LoginResponse.fromJson(Map<String, dynamic> objectJson) {
    id = objectJson['id'];
    name = objectJson['name'];
    order = objectJson['order'];
    height = objectJson['height'];
    weight = objectJson['weight'];
    list = _mapToList(objectJson);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['height'] = height;
    data['weight'] = weight;
    data['stats'] = list.map((o) => o.toJson()).toList();
    return data;
  }

  List<LoginResponseList> _mapToList(Map<String, dynamic> objectJson) {
    return objectJson["stats"] != null ? objectJson["stats"].map<LoginResponseList>((json) => LoginResponseList.fromJson(json))
                                                            .toList() : [];
  }

  @override
  String toString() {
    return 'LoginResponse{id: $id, name: $name, order: $order, height: $height, weight: $weight, list: $list}';
  }

  static Future<LoginResponse> get() {
    return Preferences.getString("user")
    .then((object) => LoginResponse.fromJson(convert.json.decode(object)));
  }

  void save() {
    Preferences.setString("user", convert.json.encode(toJson()));
  }
}
