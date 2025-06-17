import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/add_coach_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_add_player_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_home_view.dart';
import 'package:spectra_sports/features/admin/home/presentation/views/admin_team_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/auth_gate.dart';
import 'package:spectra_sports/features/coach/home/presentation/views/coach_home_view.dart';
import 'package:spectra_sports/features/parent/home/presentation/views/parent_home_view.dart';
import 'package:spectra_sports/features/splash/presentation/views/splash_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/login_view.dart';
import 'package:spectra_sports/features/auth/presentation/views/sign_up_view.dart';
import 'package:spectra_sports/features/parent/home/presentation/view_models/parent_players_cubit/parent_players_cubit.dart';
import 'package:spectra_sports/features/parent/home/data/repos/parent_home_repo_impl.dart';

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
        builder: (context, state) => const CoachHomeView(),
      ),
      GoRoute(
        path: parentHomeRoute,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ParentPlayersCubit(
              locator<ParentHomeRepoImpl>(),
            )..getPlayersData(),
            child: const ParentHomeView(),
          );
        },
      ),
      GoRoute(
        path: addPlayerRoute,
        builder: (context, state) {
          final arguments = state.extra as (String, String);
          return AdminAddPlayerView(
            teamName: arguments.$1,
            coachName: arguments.$2,
          );
        },
      ),
      GoRoute(
        path: addCoachRoute,
        builder: (context, state) {
          final teamName = state.extra as String;
          return AddCoachView(teamName: teamName);
        },
      )
    ],
  );
}
