import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPrefService {
  static Future<bool> saveString(
      {required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setString(key, value);
    return isSaved;
  }

  static Future<bool> saveInteger(
      {required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setInt(key, value);
    return isSaved;
  }

  static Future<bool> saveDouble(
      {required String key, required double value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSaved = await prefs.setDouble(key, value);
    return isSaved;
  }

  static Future<String?> getString() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? myName = prefs.getString("name");
    return myName;
  }

  static Future<bool> deleteData({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDeleted = await prefs.remove(key);
    return isDeleted;
  }

  static Future<bool> saveObject(
      {required Map objectMap, required String objectKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringObj = jsonEncode(objectMap);
    bool isSaved = await prefs.setString(objectKey, stringObj);
    return isSaved;
  }

  static Future<User> getUserObject() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stringUser = await prefs.getString("myObj");
    Map<String, dynamic> userMap = jsonDecode(stringUser!);
    User user = User.fromMap(userMap);
    return user;
  }
}
