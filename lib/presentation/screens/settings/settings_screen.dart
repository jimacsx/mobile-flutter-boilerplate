import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String name = 'settings_screen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'en';

  final Map<String, String> _languages = {
    'en': 'English',
    'es': 'Español',
    'zh': '中文',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SegmentedButton<String>(
              segments: _languages.entries
                  .map((entry) => ButtonSegment<String>(
                        value: entry.key,
                        label: Text(entry.value),
                      ))
                  .toList(),
              selected: <String>{_selectedLanguage},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedLanguage = newSelection.first;
                });
                // TODO: Integrate with localization provider/state
              },
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              showSelectedIcon: false,
            ),
            const SizedBox(height: 32),
            Text(
              'Current language: ${_languages[_selectedLanguage]}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
} 