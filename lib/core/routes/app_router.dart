import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const loginRoute = '/login';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginRoute,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
