import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';

class AdminTeamView extends StatelessWidget {
  const AdminTeamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Team 2010'),
        ],
      ),
    );
  }
}
