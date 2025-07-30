import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<void> setDarkMode(bool isDarkMode);
  Future<bool> getDarkMode();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  static const String _darkModeKey = 'dark_mode';

  @override
  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDarkMode);
  }

  @override
  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false; // Default to light mode
  }
} 