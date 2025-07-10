import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/domain/entities/language.dart';
import 'package:banking_flutter_app/domain/repositories/translation_repository.dart';
import 'package:banking_flutter_app/data/repositories/translation_repository_impl.dart';
import 'package:banking_flutter_app/data/datasources/local/translation_local_datasource.dart';
import 'package:banking_flutter_app/domain/usecases/translation_usecases.dart';

// Dependency injection providers
final translationLocalDataSourceProvider = Provider<TranslationLocalDataSource>(
  (ref) => TranslationLocalDataSourceImpl(),
);

final translationRepositoryProvider = Provider<TranslationRepository>(
  (ref) => TranslationRepositoryImpl(
    ref.watch(translationLocalDataSourceProvider),
  ),
);

final getSupportedLanguagesUseCaseProvider = Provider<GetSupportedLanguagesUseCase>(
  (ref) => GetSupportedLanguagesUseCase(
    ref.watch(translationRepositoryProvider),
  ),
);

final getCurrentLanguageUseCaseProvider = Provider<GetCurrentLanguageUseCase>(
  (ref) => GetCurrentLanguageUseCase(
    ref.watch(translationRepositoryProvider),
  ),
);

final setCurrentLanguageUseCaseProvider = Provider<SetCurrentLanguageUseCase>(
  (ref) => SetCurrentLanguageUseCase(
    ref.watch(translationRepositoryProvider),
  ),
);

final getTranslationUseCaseProvider = Provider<GetTranslationUseCase>(
  (ref) => GetTranslationUseCase(
    ref.watch(translationRepositoryProvider),
  ),
);

final getAllTranslationsUseCaseProvider = Provider<GetAllTranslationsUseCase>(
  (ref) => GetAllTranslationsUseCase(
    ref.watch(translationRepositoryProvider),
  ),
);

// State providers
final supportedLanguagesProvider = FutureProvider<List<Language>>(
  (ref) => ref.watch(getSupportedLanguagesUseCaseProvider).call(),
);

final currentLanguageProvider = StateNotifierProvider<LanguageNotifier, AsyncValue<Language>>(
  (ref) => LanguageNotifier(ref),
);

final translationsProvider = StateNotifierProvider<TranslationsNotifier, AsyncValue<Map<String, String>>>(
  (ref) => TranslationsNotifier(ref),
);

// Notifiers
class LanguageNotifier extends StateNotifier<AsyncValue<Language>> {
  final Ref ref;

  LanguageNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    try {
      state = const AsyncValue.loading();
      final language = await ref.read(getCurrentLanguageUseCaseProvider).call();
      state = AsyncValue.data(language);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> setLanguage(Language language) async {
    try {
      state = const AsyncValue.loading();
      await ref.read(setCurrentLanguageUseCaseProvider).call(language);
      state = AsyncValue.data(language);
      
      // Refresh translations when language changes
      ref.read(translationsProvider.notifier).loadTranslations();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class TranslationsNotifier extends StateNotifier<AsyncValue<Map<String, String>>> {
  final Ref ref;

  TranslationsNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadTranslations();
  }

  Future<void> loadTranslations() async {
    try {
      state = const AsyncValue.loading();
      final translations = await ref.read(getAllTranslationsUseCaseProvider).call();
      state = AsyncValue.data(translations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  String getTranslation(String key) {
    return state.when(
      data: (translations) => translations[key] ?? key,
      loading: () => key,
      error: (_, __) => key,
    );
  }
}

// Convenience provider for getting translations
final translationProvider = Provider.family<String, String>(
  (ref, key) {
    final translationsState = ref.watch(translationsProvider);
    return translationsState.when(
      data: (translations) => translations[key] ?? key,
      loading: () => key,
      error: (_, __) => key,
    );
  },
); 