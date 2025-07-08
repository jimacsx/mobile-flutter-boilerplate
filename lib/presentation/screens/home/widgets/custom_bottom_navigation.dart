import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar( // con un solo Item no funciona mínimo deben ser 2 Items
      elevation: 0,
      currentIndex: 0,

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