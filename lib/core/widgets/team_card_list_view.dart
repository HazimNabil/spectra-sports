import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/widgets/team_card.dart';

class TeamCardListView extends StatelessWidget {
  final List<Team> teams;

  const TeamCardListView({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: teams.length,
      itemBuilder: (_, index) {
        return TeamCard(team: teams[index]);
      },
    );
  }
}
