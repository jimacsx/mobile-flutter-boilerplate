import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/presentation/screens/home/views/views.dart';
import 'package:banking_flutter_app/presentation/screens/home/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';

  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    TransferView(),
    PayView(),
    HelpView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      key: homeViewScaffoldKey,
      body: IndexedStack(index: pageIndex, children: viewRoutes),
      endDrawer: SideMenu(),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}




