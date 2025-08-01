import 'package:banking_flutter_app/domain/entities/language.dart';
import 'package:banking_flutter_app/domain/repositories/translation_repository.dart';
import 'package:banking_flutter_app/data/datasources/local/translation_local_datasource.dart';

class TranslationRepositoryImpl implements TranslationRepository {
  final TranslationLocalDataSource localDataSource;

  TranslationRepositoryImpl(this.localDataSource);

  @override
  Future<List<Language>> getSupportedLanguages() async {
    return [
      const Language(code: 'en', name: 'English', nativeName: 'English'),
      const Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
      const Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
    ];
  }

  @override
  Future<Language> getCurrentLanguage() async {
    final currentLanguage = await localDataSource.getCurrentLanguage();
    return currentLanguage ?? const Language(code: 'es', name: 'Spanish', nativeName: 'Español');
  }

  @override
  Future<void> setCurrentLanguage(Language language) async {
    await localDataSource.setCurrentLanguage(language);
  }

  @override
  Future<String> getTranslation(String key) async {
    final currentLanguage = await getCurrentLanguage();
    final translations = await localDataSource.getTranslations(currentLanguage.code);
    return translations[key] ?? key; // Return key if translation not found
  }

  @override
  Future<Map<String, String>> getAllTranslations() async {
    final currentLanguage = await getCurrentLanguage();
    return await localDataSource.getTranslations(currentLanguage.code);
  }
} 