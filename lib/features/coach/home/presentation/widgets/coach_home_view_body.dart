import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo_impl.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/attendance_cubit/attendance_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/coach_matches_cubit/coach_matches_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/get_team_cubit/get_team_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_section.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_matches_section.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_players_section.dart';

class CoachHomeViewBody extends StatelessWidget {
  final String teamName;

  const CoachHomeViewBody({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: teamName,
          showBackButton: false,
        ),
        const SizedBox(height: 8),
        const CustomTabBar(
          tabs: ['Matches', 'Players', 'Attendance'],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => CoachMatchesCubit(
                  locator<CoachHomeRepoImpl>(),
                )..getMatches(),
                child: const CoachMatchesSection(),
              ),
              BlocProvider(
                create: (context) => GetTeamCubit(
                  locator<CoachHomeRepoImpl>(),
                )..getTeam(),
                child: const CoachPlayersSection(),
              ),
              BlocProvider(
                create: (context) => AttendanceCubit(
                  locator<CoachHomeRepoImpl>(),
                ),
                child: AttendanceSection(teamName: teamName),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
