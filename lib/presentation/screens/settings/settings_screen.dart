import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/domain/entities/language.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static const String name = 'settings_screen';

  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final supportedLanguagesAsync = ref.watch(supportedLanguagesProvider);
    final currentLanguageAsync = ref.watch(currentLanguageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TranslatedText(
              'select_language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            supportedLanguagesAsync.when(
              data: (languages) => _buildLanguageSelector(languages),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
            ),
            const SizedBox(height: 32),
            currentLanguageAsync.when(
              data: (currentLanguage) => TranslatedText(
                'current_language',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              loading: () => const Text('Loading...'),
              error: (error, stack) => Text('Error: $error'),
            ),
            const SizedBox(height: 8),
            currentLanguageAsync.when(
              data: (currentLanguage) => Text(
                ': ${currentLanguage.nativeName}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              loading: () => const Text(''),
              error: (error, stack) => const Text(''),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(List<Language> languages) {
    final currentLanguageAsync = ref.watch(currentLanguageProvider);
    
    return currentLanguageAsync.when(
      data: (currentLanguage) => SegmentedButton<String>(
        segments: languages
            .map((language) => ButtonSegment<String>(
                  value: language.code,
                  label: Text(language.nativeName),
                ))
            .toList(),
        selected: <String>{currentLanguage.code},
        onSelectionChanged: (Set<String> newSelection) {
          final selectedLanguage = languages.firstWhere(
            (lang) => lang.code == newSelection.first,
          );
          ref.read(currentLanguageProvider.notifier).setLanguage(selectedLanguage);
        },
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
        ),
        showSelectedIcon: false,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
} 