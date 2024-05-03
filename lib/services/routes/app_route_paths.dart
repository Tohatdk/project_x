class AppRoutePaths {
  static const homePageRoute = AppRoute(
    name: 'HomePage',
    path: '/home',
    fullPath: '/home',
  );

  static const loginPageRoute = AppRoute(
    name: 'LoginPage',
    path: '/login',
    fullPath: '/login',
  );
  static const registerPageRoute = AppRoute(
    name: 'RegisterPage',
    path: 'register',
    fullPath: '/login/register',
  );
  static const forgotPasswordPageRoute = AppRoute(
    name: 'ForgotPasswordPage',
    path: 'forgot',
    fullPath: '/login/forgot',
  );
  static const profilePageRoute = AppRoute(
    name: 'ProfilePage',
    path: 'profile',
    fullPath: '/home/profile',
  );
}

class AppRoute {
  final String fullPath;
  final String path;
  final String name;

  const AppRoute({
    required this.name,
    required this.path,
    required this.fullPath,
  });
}
