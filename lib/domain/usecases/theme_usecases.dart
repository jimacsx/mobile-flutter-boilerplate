import 'package:banking_flutter_app/domain/repositories/theme_repository.dart';

class GetDarkModeUseCase {
  final ThemeRepository repository;

  GetDarkModeUseCase(this.repository);

  Future<bool> call() => repository.getDarkMode();
}

class SetDarkModeUseCase {
  final ThemeRepository repository;

  SetDarkModeUseCase(this.repository);

  Future<void> call(bool isDarkMode) => repository.setDarkMode(isDarkMode);
} 