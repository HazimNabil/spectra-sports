import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_match_card.dart';

class MatchCardListView extends StatelessWidget {
  final List<MatchModel> matches;

  const MatchCardListView({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: matches.length,
      itemBuilder: (_, index) {
        return AdminMatchCard(
          match: matches[index],
        );
      },
    );
  }
}
