import 'package:banking_flutter_app/presentation/login/screens/login_screen.dart';
import 'package:banking_flutter_app/routing/routes.dart';
import 'package:banking_flutter_app/presentation/home/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
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
      path: publicRoutes['login']!,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);