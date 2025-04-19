import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo_impl.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/players_cubit/players_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_matches_section.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_members_section.dart';

class AdminTeamView extends StatelessWidget {
  final Team team;

  const AdminTeamView({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'Team ${team.name}'),
            const SizedBox(height: 8),
            const CustomTabBar(
              tabs: ['Matches', 'Members'],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  AdminMatchesSection(
                    matches: team.matches,
                    teamId: team.id,
                  ),
                  BlocProvider(
                    create: (context) => PlayersCubit(
                      locator<AdminHomeRepoImpl>(),
                    )..getPlayers(team.name),
                    child:  AdminMembersSection(
                      teamName: team.name,
                      coachName: team.players[0].coachName,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
