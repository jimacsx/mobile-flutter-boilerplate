import 'package:flutter/material.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('help.title'),
      ),
      body: const Center(child: TranslatedText('help.body')),
    );
  }
}