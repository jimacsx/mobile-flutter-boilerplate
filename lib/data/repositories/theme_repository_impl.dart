import 'package:banking_flutter_app/domain/repositories/theme_repository.dart';
import 'package:banking_flutter_app/data/datasources/local/theme_local_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl(this.localDataSource);

  @override
  Future<bool> getDarkMode() async {
    return await localDataSource.getDarkMode();
  }

  @override
  Future<void> setDarkMode(bool isDarkMode) async {
    await localDataSource.setDarkMode(isDarkMode);
  }
} 