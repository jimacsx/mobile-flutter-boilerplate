import 'package:banking_flutter_app/domain/entities/language.dart';

abstract class TranslationRepository {
  /// Get all supported languages
  Future<List<Language>> getSupportedLanguages();
  
  /// Get current language
  Future<Language> getCurrentLanguage();
  
  /// Set current language
  Future<void> setCurrentLanguage(Language language);
  
  /// Get translation for a key in current language
  Future<String> getTranslation(String key);
  
  /// Get all translations for current language
  Future<Map<String, String>> getAllTranslations();
} 