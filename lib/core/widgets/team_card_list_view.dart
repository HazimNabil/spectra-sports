import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/team_card.dart';

class TeamCardListView extends StatelessWidget {
  const TeamCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, index) {
        return const TeamCard();
      },
    );
  }
}
