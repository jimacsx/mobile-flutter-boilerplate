const Map<String, String> publicRoutes = {
  'onboarding': '/onboarding',
  'login': '/login',
  'resetPassword': '/reset-pasword',
  'signin': '/sign-in',
};

const initialLocationRoute = '/home/0';

const Map<String, String> privateRoutes = {
  'home': '/home/:page',
  'profile': '/profile',
  'settings': '/settings',
};

const Map<String, String> homeViewsRoutes = {
  'home': '/home/0',
  'transfer': '/home/1',
  'pay': '/home/2',
  'help': '/home/3',
};

const Map<String, String> widgetRoutes = {
  'buttons': '/buttons',
  'cards': '/cards',
  'progress': '/progress',
  'ui-controls': '/ui-controls',
  'snackbars': '/snackbars',
  'animated': '/animated',
  'drawer': '/drawer',
  'bottom-bar': '/bottom-bar',
  'infinite': '/infinite',
  'tutorial': '/tutorial',
  'counter-riverpod': '/counter-riverpod',
  'translation-demo': '/translation-demo',
};
