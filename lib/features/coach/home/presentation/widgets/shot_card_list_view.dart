import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_stat_tile.dart';

class ShotCardListView extends StatelessWidget {
  const ShotCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...List.generate(
          10,
          (index) => const ShotCard(),
        ),
        const SizedBox(height: 8),
        Divider(
          color: Colors.grey[400],
          indent: 16,
          endIndent: 16,
          thickness: 1.5,
        ),
        const ShotStatTile(title: 'Total Shots', stat: '10'),
        const ShotStatTile(title: 'Total Goals', stat: '7'),
        const ShotStatTile(title: 'Goal Probability', stat: '70%'),
      ],
    );
  }
}
