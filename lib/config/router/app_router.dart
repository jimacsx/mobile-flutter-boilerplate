import 'package:go_router/go_router.dart';
import 'package:banking_flutter_app/config/config.dart';
import 'package:banking_flutter_app/presentation/screens/screens.dart';
import 'package:banking_flutter_app/presentation/custom-widgets/screens/screens.dart';
import 'package:banking_flutter_app/features/auth/auth.dart';
import 'package:banking_flutter_app/features/profile/profile.dart';

final appRouter = GoRouter(
  initialLocation: initialLocationRoute,
  routes: [
    // ------ private routes ------
    GoRoute(
      path: privateRoutes['home']!,
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => initialLocationRoute,
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
    // ------ public routes -------
    GoRoute(
      path: publicRoutes['login']!,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: publicRoutes['loginEmail']!,
      name: EmailScreen.name,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: publicRoutes['loginPassword']!,
      name: PasswordScreen.name,
      builder: (context, state) => const PasswordScreen(),
    ),
    GoRoute(
      path: publicRoutes['recoverPassword']!,
      name: RecoverPasswordScreen.name,
      builder: (context, state) => const RecoverPasswordScreen(),
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
    GoRoute(
      path: widgetRoutes['bottom-bar']!,
      name: BottomBarScreen.name,
      builder: (context, state) => const BottomBarScreen(),
    ),
    GoRoute(
      path: widgetRoutes['drawer']!,
      name: DrawerScreen.name,
      builder: (context, state) => const DrawerScreen(),
    ),
    GoRoute(
      path: widgetRoutes['counter-riverpod']!,
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: widgetRoutes['translation-demo']!,
      name: TranslationDemoScreen.name,
      builder: (context, state) => const TranslationDemoScreen(),
    ),
  ],
);
