import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/teams_view.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TeamsView(),
    );
  }
}
