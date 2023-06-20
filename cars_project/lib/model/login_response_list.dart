class LoginResponseList {
  int baseStat;

  LoginResponseList.fromJson(Map<String, dynamic> json)
      : baseStat = json["base_stat"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    return data;
  }

  @override
  String toString() {
    return 'LoginResponseList{baseStat: $baseStat}';
  }
}
