import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/presentation/screens/home/widgets/side_menu.dart';
import 'package:banking_flutter_app/presentation/screens/home/widgets/constants/home_menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey =
        GlobalKey<
          ScaffoldState
        >(); // scaffoldKey has the reference of the current state of the scaffold

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    // Uses ListView.builder to indicate that it is to be built at runtime
    return ListView.builder(
      // physics: BouncingScrollPhysics(), // Removes the scroll bouncing that occurs
      itemCount: homeMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = homeMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        // using Flutter Navigation https://docs.flutter.dev/ui/navigation
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   ),
        // );
        // Navigator.pushNamed(context, menuItem.link);

        // using go_router https://pub.dev/documentation/go_router/latest/topics/Navigation-topic.html
        // context.pushNamed( CardsScreen.name );
        context.push(menuItem.link);
      },
    );
  }
}
