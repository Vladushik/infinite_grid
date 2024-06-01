import 'package:go_router/go_router.dart';

import 'package:infinite_grid/src/features/auth/login/presentation/login_screen.dart';
import 'package:infinite_grid/src/features/error/presentation/error_screen.dart';
import 'package:infinite_grid/src/features/home/presentation/home_screen.dart';
import 'package:infinite_grid/src/features/splash/presentation/splash_screen.dart';

enum AppPages {
  splash('/'),
  login('/login'),
  home('/home');

  const AppPages(this.path);
  final String path;
}

sealed class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: AppPages.splash.path,
    errorBuilder: (_, state) => ErrorScreen(error: state.error?.message),
    routes: [
      GoRoute(
        path: AppPages.splash.path,
        name: AppPages.splash.name,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPages.login.path,
        name: AppPages.login.name,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPages.home.path,
        name: AppPages.home.name,
        builder: (_, __) => const HomeScreen(),
      ),
    ],
  );
}
