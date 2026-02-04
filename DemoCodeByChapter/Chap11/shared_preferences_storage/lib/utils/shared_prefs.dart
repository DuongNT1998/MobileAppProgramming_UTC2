import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {

  // ======================
  // SET METHODS
  // ======================

  static Future<void> setBoolValue(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }

  static Future<void> setIntValue(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, value);
  }

  static Future<void> setStringValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<void> setDoubleValue(String key, double value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setDouble(key, value);
  }

  static Future<void> setStringListValue(String key, List<String> value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(key, value);
  }

  // ======================
  // GET METHODS
  // ======================

  static bool getBoolValue(String key) {
    return SharedPreferences.getInstance()
        .then((preferences) {
      return preferences.getBool(key) ?? false;
    }) as bool;
  }

  static int getIntValue(String key) {
    return SharedPreferences.getInstance()
        .then((preferences) {
      return preferences.getInt(key) ?? 0;
    }) as int;
  }

  static String getStringValue(String key) {
    return SharedPreferences.getInstance()
        .then((preferences) {
      return preferences.getString(key) ?? "";
    }) as String;
  }
}
