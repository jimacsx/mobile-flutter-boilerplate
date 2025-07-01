import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/presentation/themes/app_theme.dart';

// ** Uses:
//  * Provider: For immutable values
//  * StateProvider: To maintain/persist a piece of state
//  * StateNotifierProvider: To maintain/persist a more complex state.

// IMMUTABLE color list
final colorListProvider = Provider((ref) => colorList);

// a single boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// a single int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// an object of type AppTheme (custom)
// * where in StateNotifierProvider<ThemeNotifier, AppTheme>
//   * ThemeNotifier: is the class that will be in charge of controlling the state of the "StateNotifier".
//   * AppTheme: is the internal state that is an instance of AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller or Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super(AppTheme()); // creates first instance of AppTheme with their default values

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
