

import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/constants/routes.dart';
import 'package:banking_flutter_app/presentation/screens/screens.dart';
import 'package:banking_flutter_app/presentation/custom-widgets/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ------ private routes ------
    GoRoute(
      path: privateRoutes['home']!,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    // ------ public routes -------
    GoRoute(
      path: publicRoutes['login']!,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    // ------ widget routes -------
    GoRoute(
      path: widgetRoutes['buttons']!,
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: widgetRoutes['cards']!,
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: widgetRoutes['progress']!,
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: widgetRoutes['snackbars']!,
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: widgetRoutes['animated']!,
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: widgetRoutes['ui-controls']!,
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: widgetRoutes['tutorial']!,
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
     GoRoute(
      path: widgetRoutes['infinite']!,
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
  ],
);