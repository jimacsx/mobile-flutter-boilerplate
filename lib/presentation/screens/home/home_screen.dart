import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banking_flutter_app/config/constants/routes.dart';
import 'package:banking_flutter_app/presentation/providers/providers.dart';
import 'package:banking_flutter_app/presentation/screens/home/widgets/widgets.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // scaffoldKey has the reference of the current state of the scaffold
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: _HomeView(scaffoldKey: scaffoldKey),
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _HomeView({required this.scaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return CustomScrollView(
      // Slivers
      //  are special Widgets for Scroll behavior
      //  always work with the CustomScrollView
      //  and instead of having a child we have slivers: []
      // A Sliver is a Widget that works directly with the ScrollView
      slivers: [
        CustomSliverAppbar(
          scaffoldKey: scaffoldKey,
          isDarkMode: isDarkMode,
          toggleDarkMode: () {
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },
        ),
        // SliverList requests a delegate
        // delegate: is the function used to create the slivers
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 800,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TranslatedText(
                          'welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const TranslatedText(
                          'home',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        TranslatedElevatedButton(
                          'settings',
                          onPressed: () {
                            // Navigate to settings
                            context.push(privateRoutes['settings']!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 800),
                Container(height: 800),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}


