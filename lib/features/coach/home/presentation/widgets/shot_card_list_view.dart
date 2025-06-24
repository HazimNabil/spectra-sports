import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_stat_tile.dart';

class ShotCardListView extends StatelessWidget {
  final shotStats = const [
    (title: 'Total Shots', value: '10'),
    (title: 'Total Goals', value: '7'),
    (title: 'Goals Probability', value: '70%'),
  ];

  const ShotCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        ...List.generate(
          shotStats.length,
          (index) {
            final stat = shotStats[index];
            return ShotStatTile(stat: stat);
          },
        ),
      ],
    );
  }
}
