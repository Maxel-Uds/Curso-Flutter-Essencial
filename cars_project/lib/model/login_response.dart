import 'login_response_list.dart';

class LoginResponse {
  int height = 0;
  int weight = 0;
  List<LoginResponseList> list = [];

  LoginResponse.fromJson(Map<String, dynamic> objectJson) {
    height = objectJson["height"];
    weight = objectJson["height"];
    list = _mapToList(objectJson);
  }

  List<LoginResponseList> _mapToList(Map<String, dynamic> objectJson) {
    return objectJson["stats"] != null ? objectJson["stats"].map<LoginResponseList>((json) => LoginResponseList.fromJson(json))
                                                            .toList() : [];

  }

  @override
  String toString() {
    return 'LoginResponse{height: $height, weight: $weight, list: $list}';
  }
}
