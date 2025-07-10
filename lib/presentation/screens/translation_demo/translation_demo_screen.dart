import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banking_flutter_app/presentation/shared_widgets/widgets.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class TranslationDemoScreen extends ConsumerWidget {
  static const String name = 'translation_demo_screen';

  const TranslationDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('translation_demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TranslatedText(
              'welcome',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildLanguageSelectorSection(context, ref),
            const SizedBox(height: 32),
            _buildCurrentLanguageInfo(ref),
            const SizedBox(height: 32),
            _buildTranslationSection(context, ref),
            const SizedBox(height: 32),
            _buildButtonSection(context, ref),
            // Add bottom padding to ensure content doesn't get cut off by system UI
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslationSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TranslatedText(
          'translation_examples',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TranslatedText('home'),
                TranslatedText('profile'),
                TranslatedText('login'),
                TranslatedText('logout'),
                TranslatedText('email'),
                TranslatedText('password'),
                TranslatedText('submit'),
                TranslatedText('cancel'),
                TranslatedText('save'),
                TranslatedText('delete'),
                TranslatedText('edit'),
                TranslatedText('search'),
                TranslatedText('loading'),
                TranslatedText('error'),
                TranslatedText('success'),
                TranslatedText('goodbye'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TranslatedText(
          'translated_buttons',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TranslatedElevatedButton(
                'save',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TranslatedText('save_button_pressed')),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TranslatedTextButton(
                'cancel',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TranslatedText('cancel_button_pressed')),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TranslatedElevatedButton(
                'edit',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TranslatedText('edit_button_pressed')),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TranslatedElevatedButton(
                'delete',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TranslatedText('delete_button_pressed')),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageSelectorSection(BuildContext context, WidgetRef ref) {
    final supportedLanguagesAsync = ref.watch(supportedLanguagesProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TranslatedText(
          'language_selector',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        supportedLanguagesAsync.when(
          data: (languages) => Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LanguageSelector(
                languages: languages,
                title: 'select_language',
                titleStyle: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          loading: () => const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
          error: (error, stack) => Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const TranslatedText('error'),
                  const SizedBox(width: 8),
                  Text('$error'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentLanguageInfo(WidgetRef ref) {
    final currentLanguageAsync = ref.watch(currentLanguageProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TranslatedText(
          'current_language',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        currentLanguageAsync.when(
          data: (language) => Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TranslatedText('language_code'),
                      const SizedBox(width: 8),
                      Text(language.code),
                    ],
                  ),
                  Row(
                    children: [
                      const TranslatedText('language_name'),
                      const SizedBox(width: 8),
                      Text(language.name),
                    ],
                  ),
                  Row(
                    children: [
                      const TranslatedText('language_native_name'),
                      const SizedBox(width: 8),
                      Text(language.nativeName),
                    ],
                  ),
                ],
              ),
            ),
          ),
          loading: () => const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TranslatedText('loading_language_info'),
            ),
          ),
          error: (error, stack) => Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const TranslatedText('error'),
                  const SizedBox(width: 8),
                  Text('$error'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
} 