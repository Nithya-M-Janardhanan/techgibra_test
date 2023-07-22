import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _pref;
  static const _keyUsername = 'username';


  static Future<SharedPreferences?> init() async {
    if (_pref != null) {
      return _pref;
    } else {
      _pref = await SharedPreferences.getInstance();
      return _pref;
    }
  }

  static Future setUsername(String username) async {
    SharedPreferences? _preferences = await init();
    await _preferences?.setString(_keyUsername, username);
  }
  static Future<String> getUsername() async {
    String name = '';
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    name = _preferences.getString(_keyUsername) ?? '';
    debugPrint('name is.........$name');
    return name;
  }
  static Future<void> removeUser() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove(_keyUsername);
    debugPrint(' key name is.........$_keyUsername');
  }
}