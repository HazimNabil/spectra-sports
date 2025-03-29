import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';

class CoachHomeView extends StatelessWidget {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: 'Team 2010',
              showBackButton: false,
            ),
            SizedBox(height: 8),
            CustomTabBar(
              tabs: ['Matches', 'Members', 'Attendance'],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Matches')),
                  Center(child: Text('Members')),
                  Center(child: Text('Attendance')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
