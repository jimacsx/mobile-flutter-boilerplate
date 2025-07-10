import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banking_flutter_app/domain/entities/language.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';
import 'package:banking_flutter_app/presentation/providers/translation/translation_provider.dart';

class LanguageSelector extends ConsumerWidget {
  final List<Language> languages;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;

  const LanguageSelector({
    super.key,
    required this.languages,
    this.title,
    this.titleStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguageAsync = ref.watch(currentLanguageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          TranslatedText(
            title!,
            style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
        ],
        currentLanguageAsync.when(
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
        ),
      ],
    );
  }
}
