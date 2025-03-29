import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_match_card.dart';

class CoachMatchCardListView extends StatelessWidget {
  const CoachMatchCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, __) => const CoachMatchCard(),
    );
  }
}
