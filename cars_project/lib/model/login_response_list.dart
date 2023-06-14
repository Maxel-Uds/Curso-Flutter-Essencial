class LoginResponseList {
  int baseStat = 0;

  LoginResponseList.fromJson(Map<String, dynamic> json)
      : baseStat = json["base_stat"];

  @override
  String toString() {
    return 'LoginResponseList{baseStat: $baseStat}';
  }
}
