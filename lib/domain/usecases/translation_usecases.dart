import 'package:banking_flutter_app/domain/entities/language.dart';
import 'package:banking_flutter_app/domain/repositories/translation_repository.dart';

class GetSupportedLanguagesUseCase {
  final TranslationRepository repository;

  GetSupportedLanguagesUseCase(this.repository);

  Future<List<Language>> call() => repository.getSupportedLanguages();
}

class GetCurrentLanguageUseCase {
  final TranslationRepository repository;

  GetCurrentLanguageUseCase(this.repository);

  Future<Language> call() => repository.getCurrentLanguage();
}

class SetCurrentLanguageUseCase {
  final TranslationRepository repository;

  SetCurrentLanguageUseCase(this.repository);

  Future<void> call(Language language) => repository.setCurrentLanguage(language);
}

class GetTranslationUseCase {
  final TranslationRepository repository;

  GetTranslationUseCase(this.repository);

  Future<String> call(String key) => repository.getTranslation(key);
}

class GetAllTranslationsUseCase {
  final TranslationRepository repository;

  GetAllTranslationsUseCase(this.repository);

  Future<Map<String, String>> call() => repository.getAllTranslations();
} 