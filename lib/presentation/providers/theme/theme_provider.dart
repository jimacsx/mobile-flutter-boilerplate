import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/domain/repositories/theme_repository.dart';
import 'package:banking_flutter_app/data/repositories/theme_repository_impl.dart';
import 'package:banking_flutter_app/data/datasources/local/theme_local_datasource.dart';
import 'package:banking_flutter_app/domain/usecases/theme_usecases.dart';

// Dependency injection providers
final themeLocalDataSourceProvider = Provider<ThemeLocalDataSource>(
  (ref) => ThemeLocalDataSourceImpl(),
);

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => ThemeRepositoryImpl(
    ref.watch(themeLocalDataSourceProvider),
  ),
);

final getDarkModeUseCaseProvider = Provider<GetDarkModeUseCase>(
  (ref) => GetDarkModeUseCase(
    ref.watch(themeRepositoryProvider),
  ),
);

final setDarkModeUseCaseProvider = Provider<SetDarkModeUseCase>(
  (ref) => SetDarkModeUseCase(
    ref.watch(themeRepositoryProvider),
  ),
);

// State providers
final isDarkModeProvider = StateNotifierProvider<ThemeNotifier, AsyncValue<bool>>(
  (ref) => ThemeNotifier(ref),
);

final themeNotifierProvider = StateNotifierProvider<AppThemeNotifier, AppTheme>(
  (ref) => AppThemeNotifier(ref),
);

// Notifiers
class ThemeNotifier extends StateNotifier<AsyncValue<bool>> {
  final Ref ref;

  ThemeNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadDarkMode();
  }

  Future<void> _loadDarkMode() async {
    try {
      state = const AsyncValue.loading();
      final isDarkMode = await ref.read(getDarkModeUseCaseProvider).call();
      state = AsyncValue.data(isDarkMode);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> toggleDarkMode() async {
    try {
      final currentState = state.value ?? false;
      final newDarkMode = !currentState;
      
      state = const AsyncValue.loading();
      await ref.read(setDarkModeUseCaseProvider).call(newDarkMode);
      state = AsyncValue.data(newDarkMode);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class AppThemeNotifier extends StateNotifier<AppTheme> {
  final Ref ref;

  AppThemeNotifier(this.ref) : super(AppTheme()) {
    _initializeTheme();
  }

  void _initializeTheme() {
    ref.listen<AsyncValue<bool>>(isDarkModeProvider, (previous, next) {
      next.whenData((isDarkMode) {
        state = state.copyWith(isDarkMode: isDarkMode);
      });
    });
  }

  void toggleDarkMode() {
    ref.read(isDarkModeProvider.notifier).toggleDarkMode();
  }
}
