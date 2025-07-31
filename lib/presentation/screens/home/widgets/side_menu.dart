import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'constants/home_menu_items.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/presentation/shared_widgets/translated_text.dart';

class SideMenu extends StatefulWidget {

  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This is to know the size of the distance at the top of the
    // notch (in ios). This value will be bigger in ios than in android.
    // final notchSpace = MediaQuery.of(context).viewPadding.top;
    // if (Platform.isAndroid) {
    //   print('Android $notchSpace');
    // } else {
    //   print('IOS $notchSpace');
    // }
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    // @see: https://api.flutter.dev/flutter/material/NavigationDrawer-class.html
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        
        setState(() {
          navDrawerIndex = value;
        });

        // navigation
        final menuItem = homeMenuItems[value];
        context.push(menuItem.link);
        // close Drawer
        homeViewScaffoldKey.currentState?.closeEndDrawer();
        // if we want to access the properties of the
        // statefulWidget we have to do it through `widget.`.

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const TranslatedText(
            'screens_section',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        ...homeMenuItems
            .sublist(
              0,
              6,
            ) // now includes Settings + 6 items (including Translation Demo)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: TranslatedText(menuItem.titleKey),
              ),
            ),

        // Divider bar
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: TranslatedText(
            'widgets_section',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        ...homeMenuItems
            .sublist(6)
            .map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: TranslatedText(menuItem.titleKey),
              ),
            ),
      ],
    );
  }
}
