import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/constants/routes.dart';
import 'package:banking_flutter_app/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(homeViewsRoutes['home']!);
        break;
      case 1:
        context.go(homeViewsRoutes['transfer']!);
        break;
      case 2:
        context.go(homeViewsRoutes['pay']!);
        break;
      case 3:
        context.go(homeViewsRoutes['help']!);
        break;
      default:
        context.go(homeViewsRoutes['home']!);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get translations using the provider
    final homeLabel = ref.watch(translationProvider('home.bottomNavigation.home'));
    final transferLabel = ref.watch(translationProvider('home.bottomNavigation.transfer'));
    final payLabel = ref.watch(translationProvider('home.bottomNavigation.pay'));
    final helpLabel = ref.watch(translationProvider('home.bottomNavigation.help'));

    return BottomNavigationBar(
      // with only one Item does not work, minimum 2 Items are required
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_filled),
          label: homeLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.arrow_outward),
          label: transferLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.credit_card),
          label: payLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.live_help_outlined),
          label: helpLabel,
        ),
      ],
      // With less than 4 elements: 
      //    BottomNavigationBarType.fixed is used automatically
      // With 4 or more elements: 
      //    type is changed to BottomNavigationBarType.shifting
      // therefore we set type to BottomNavigationBarType.fixed,
      // the other solution is to add a backgroundColor to each 
      // element
      type: BottomNavigationBarType.fixed
    );
  }
}