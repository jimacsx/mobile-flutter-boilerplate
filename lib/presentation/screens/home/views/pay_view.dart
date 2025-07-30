import 'package:flutter/material.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TranslatedText('pay.title'),
      ),
      body: const Center(child: TranslatedText('pay.body')),
    );
  }
}