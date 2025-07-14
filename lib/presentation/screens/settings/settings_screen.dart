import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/widgets.dart';

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

    return Scaffold(
      appBar: AppBar(title: const TranslatedText('settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: supportedLanguagesAsync.when(
          data:
              (languages) => LanguageSelector(
                languages: languages,
                title: 'select_language',
                titleStyle: Theme.of(context).textTheme.bodyLarge,
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
