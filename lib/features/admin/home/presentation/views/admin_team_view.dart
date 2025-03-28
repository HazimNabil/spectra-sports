import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_matches_section.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_members_section.dart';

class AdminTeamView extends StatelessWidget {
  const AdminTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'Team 2010'),
            SizedBox(height: 8),
            CustomTabBar(
              tabs: ['Matches', 'Members'],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  AdminMatchesSection(),
                  AdminMembersSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
