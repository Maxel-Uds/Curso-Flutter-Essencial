import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static void setInt(String key, int i) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, i);
  }
}