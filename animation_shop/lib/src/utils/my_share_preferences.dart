import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  Future<SharedPreferences>? _prefs;
  static MySharedPreferences? _sharedPreferences;
  MySharedPreferences._() {
    _prefs = SharedPreferences.getInstance();
  }

  static MySharedPreferences? getInstance() {
    if (_sharedPreferences == null) {
      _sharedPreferences = MySharedPreferences._();
    }
    return _sharedPreferences;
  }

  static const String _IS_DARK = "is_dark";

  void setTheme(bool isDark) async {
    (await _prefs)!.setBool(_IS_DARK, isDark);
  }

  Future<bool?> isDarkTheme() async {
    return (await _prefs)!.getBool(_IS_DARK);
  }
}
