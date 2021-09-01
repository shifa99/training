import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> initlize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async 
      {
    if (value is int)
      return await sharedPreferences.setInt(key, value);
    else if (value is String)
      return await sharedPreferences.setString(key, value);
    else if (value is double)
      return await sharedPreferences.setDouble(key, value);
    else
      return await sharedPreferences.setBool(key, value);
  }

  static dynamic getData(String key) 
  {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData(String key) async 
  {
  return await  sharedPreferences.remove(key);
  }
}
