import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/presentation/custom-widgets/providers/counter_provider.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const TranslatedText('counter_screen')),

      body: Center(
        child: TranslatedText(
          'counter_value',
          values: {'count': clickCounter},
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
