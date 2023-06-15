class LoginResponseList {
  int baseStat;

  LoginResponseList.fromJson(Map<String, dynamic> json)
      : baseStat = json["base_stat"];

  @override
  String toString() {
    return 'LoginResponseList{baseStat: $baseStat}';
  }
}
