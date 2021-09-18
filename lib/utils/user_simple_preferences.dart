import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keySelectedZone = 'selectedZone';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setSelectedZone(String selectedZone) async =>
      await _preferences?.setString(_keySelectedZone, selectedZone);

  static String? getSelectedZone = _preferences?.getString(_keySelectedZone);
}
