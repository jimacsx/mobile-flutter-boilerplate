import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/constants/routes.dart';

class CustomBottomNavigation extends StatelessWidget {
  
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
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // with only one Item does not work, minimum 2 Items are required
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_outward),
          label: 'Transferir',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Pagar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_help_outlined),
          label: 'Ayuda',
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