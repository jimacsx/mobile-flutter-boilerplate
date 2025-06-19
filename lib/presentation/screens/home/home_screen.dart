import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banking_flutter_app/presentation/home/widgets/widgets.dart';
import 'package:banking_flutter_app/presentation/providers/providers.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // scaffoldKey has the reference of the current state of the scaffold
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(child: Image.asset('assets/images/logo.png', height: 28)),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: const Center(child: Text('Bankify Home Screen')),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
