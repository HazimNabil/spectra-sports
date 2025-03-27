import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/team_card.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 22,
      children: [
        CustomAppBar(),
        TeamCard(),
      ],
    );
  }
}
