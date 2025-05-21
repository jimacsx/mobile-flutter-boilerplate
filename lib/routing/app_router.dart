import 'package:banking_flutter_app/routing/routes.dart';
import 'package:banking_flutter_app/presentation/home/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: privateRoutes['bottom-bar']!,
      name: BottomBarScreen.name,
      builder: (context, state) => const BottomBarScreen(),
    ),
    GoRoute(
      path: privateRoutes['profile']!,
      name: ProfileScreen.name,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: privateRoutes['settings']!,
      name: SettingsScreen.name,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: privateRoutes['drawer']!,
      name: DrawerScreen.name,
      builder: (context, state) => const DrawerScreen(),
    ),
    GoRoute(
      path: publicRoutes['login']!,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: privateRoutes['home']!,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: privateRoutes['buttons']!,
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: privateRoutes['cards']!,
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: privateRoutes['progress']!,
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: privateRoutes['snackbars']!,
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: privateRoutes['animated']!,
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: privateRoutes['ui-controls']!,
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),
    GoRoute(
      path: privateRoutes['tutorial']!,
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
    ),
     GoRoute(
      path: privateRoutes['infinite']!,
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
  ],
);