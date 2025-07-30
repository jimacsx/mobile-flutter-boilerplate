import 'package:flutter/material.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class TransferView extends StatelessWidget {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('transfer.title'),
      ),
      body: const Center(child: TranslatedText('transfer.body')),
    );
  }
}