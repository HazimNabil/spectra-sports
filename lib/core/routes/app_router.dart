import 'package:go_router/go_router.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_home_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_team_view.dart';
import 'package:spectra_sports/features/coach/home/presentation/views/coach_home_view.dart';
import 'package:spectra_sports/features/splash/presentation/views/splash_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/login_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const loginRoute = '/login';
  static const signUpRoute = '/sign_up';
  static const adminHomeRoute = '/admin_home';
  static const adminTeamRoute = '/admin_team';
  static const coachHomeRoute = '/coach_home';

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
      GoRoute(
        path: adminHomeRoute,
        builder: (context, state) => const AdminHomeView(),
      ),
      GoRoute(
        path: adminTeamRoute,
        builder: (context, state) => const AdminTeamView(),
      ),
      GoRoute(
        path: coachHomeRoute,
        builder: (context, state) => const CoachHomeView(),
      ),
    ],
  );
}
