import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil{
  static SharedPreferences prefsInstance;

  static Future<void> initPrefsInstance(SharedPreferences param){
    if (null == prefsInstance)
      prefsInstance = param;
  }
}