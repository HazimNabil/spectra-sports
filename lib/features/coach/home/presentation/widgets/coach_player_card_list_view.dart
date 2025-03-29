import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_player_card.dart';

class CoachPlayerCardListView extends StatelessWidget {
  const CoachPlayerCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, __) => const CoachPlayerCard(),
    );
  }
}
