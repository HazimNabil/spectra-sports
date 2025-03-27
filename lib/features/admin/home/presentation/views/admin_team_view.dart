import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';

class AdminTeamView extends StatelessWidget {
  const AdminTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          spacing: 20,
          children: [
            CustomAppBar(title: 'Team 2010'),
            CustomTabBar(
              tabs: ['Matches', 'Members'],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Matches')),
                  Center(child: Text('Members')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
