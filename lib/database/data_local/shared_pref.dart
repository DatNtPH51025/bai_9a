import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();

  static SharedPref? _instance;

  static SharedPref get instance {
    return _instance ??= SharedPref._();
  }

  Future<void> setString({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? result = prefs.getString(key);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> setBool({required String key, required bool value}) async {
    print("value");
    print(value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? result = await prefs.getBool(key);

      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> setDouble({required String key, required double value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  Future<double?> getInt(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      double? result = prefs.getDouble(key);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
