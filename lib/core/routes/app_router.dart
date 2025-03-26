import 'package:go_router/go_router.dart';
import 'package:spectra_sports/features/splash/presentation/views/splash_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/login_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const loginRoute = '/login';
  static const signUpRoute = '/sign_up';

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
      GoRoute(
        path: signUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
