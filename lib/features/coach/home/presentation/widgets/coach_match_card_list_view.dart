import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_match_card.dart';

class CoachMatchCardListView extends StatelessWidget {
  final List<MatchModel> matches;

  const CoachMatchCardListView({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: matches.length,
      itemBuilder: (_, index) {
        return CoachMatchCard(
          match: matches[index],
        );
      },
    );
  }
}
