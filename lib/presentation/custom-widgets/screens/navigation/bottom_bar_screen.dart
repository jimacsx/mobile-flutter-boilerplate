import 'package:flutter/material.dart';
import 'package:banking_flutter_app/presentation/custom-widgets/screens/screens.dart';

class BottomBarScreen extends StatefulWidget {
  static const String name = 'bottom_bar_screen';

  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int count) {
    setState(() {
      _selectedIndex = count;
    });
  }

  final List _pages = [
    HomePage(),
    ProfileScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigationBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen")),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      )
    );
  }
}