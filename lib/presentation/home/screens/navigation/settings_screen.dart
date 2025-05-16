import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = 'settings_screen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings screen'),),
      // backgroundColor: Colors.blue,
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