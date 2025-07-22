import 'package:flutter/material.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay View'),
      ),
      body: const Center(child: Text('Pagar')),
    );
  }
}