import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_view_body.dart';

class AddMatchView extends StatelessWidget {
  final String teamId;

  const AddMatchView({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddMatchViewBody(teamId: teamId),
    );
  }
}
