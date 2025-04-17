import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_player_card.dart';

class CoachPlayerCardListView extends StatelessWidget {
  final List<Player> players;

  const CoachPlayerCardListView({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: players.length,
      itemBuilder: (_, index) {
        return CoachPlayerCard(
          player: players[index],
        );
      },
    );
  }
}
