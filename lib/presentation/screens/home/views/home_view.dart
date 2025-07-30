import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:banking_flutter_app/config/constants/routes.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/widgets.dart';
import 'package:banking_flutter_app/presentation/screens/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  // constructor
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // Slivers
      //  are special Widgets for Scroll behavior
      //  always work with the CustomScrollView
      //  and instead of having a child we have slivers: []
      // A Sliver is a Widget that works directly with the ScrollView
      slivers: [
        const CustomSliverAppbar(),
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