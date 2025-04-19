import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_coach_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_add_player_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_match_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_home_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_team_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/auth_gate.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo_impl.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/get_team_cubit/get_team_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/views/coach_home_view.dart';
import 'package:spectra_sports/features/parent/home/presentation/views/parent_home_view.dart';
import 'package:spectra_sports/features/splash/presentation/views/splash_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/login_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/sign_up_view.dart';

abstract class AppRouter {
  static const splashRoute = '/';
  static const authGateRoute = '/auth_gate';
  static const loginRoute = '/login';
  static const signUpRoute = '/sign_up';
  static const adminHomeRoute = '/admin_home';
  static const adminTeamRoute = '/admin_team';
  static const coachHomeRoute = '/coach_home';
  static const parentHomeRoute = '/parent_home';
  static const addPlayerRoute = '/admin_add_player';
  static const addMatchRoute = '/add_match';
  static const addCoachRoute = '/add_coach';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: authGateRoute,
        builder: (context, state) => const AuthGate(),
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
        builder: (context, state) {
          return AdminTeamView(team: state.extra as Team);
        },
      ),
      GoRoute(
        path: coachHomeRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetTeamCubit(
              locator<CoachHomeRepoImpl>(),
            )..getTeam(state.extra as String),
            child: const CoachHomeView(),
          );
        },
      ),
      GoRoute(
        path: parentHomeRoute,
        builder: (context, state) => const ParentHomeView(),
      ),
      GoRoute(
        path: addPlayerRoute,
        builder: (context, state) {
          final (teamName, coachName) = state.extra as (String, String);
          return AdminAddPlayerView(
            teamName: teamName,
            coachName: coachName,
          );
        },
      ),
      GoRoute(
        path: addMatchRoute,
        builder: (context, state) {
          return AddMatchView(teamId: state.extra as String);
        },
      ),
      GoRoute(
        path: addCoachRoute,
        builder: (context, state) => const AddCoachView(),
      )
    ],
  );
}
