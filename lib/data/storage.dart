import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  Future<bool> setDarkThemePref(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool('isDark', value);
  }

  Future<dynamic> getDarkThemePref() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.get('isDark');
  }

}