import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/theme/app_theme.dart';

// Provider types:
//  Provider: For immutable values
//  StateProvider: To maintain/persist a piece of state
//  StateNotifierProvider: To maintain/persist a more complex state.

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller or Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = new AppTheme();
  // creates first instance of AppTheme with their default values
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
