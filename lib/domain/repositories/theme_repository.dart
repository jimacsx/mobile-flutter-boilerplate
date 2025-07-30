abstract class ThemeRepository {
  /// Get current dark mode setting
  Future<bool> getDarkMode();
  
  /// Set dark mode setting
  Future<void> setDarkMode(bool isDarkMode);
} 