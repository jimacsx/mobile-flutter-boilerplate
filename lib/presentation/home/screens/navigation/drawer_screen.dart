import 'package:banking_flutter_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatelessWidget {
  static const String name = 'drawer_screen';

  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("Drawer example")),
      drawer: Drawer(
        backgroundColor: colors.primary,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon (Icons.abc, size: 48, color: Colors.white),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Profile", style: TextStyle(color: Colors.white)),
              onTap: () {
                context.pop();
                context.push(privateRoutes['/profile']!);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings',  style: TextStyle(color: Colors.white)),
              onTap: () {
                context.pop();
                context.push(privateRoutes['/settings']!);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}