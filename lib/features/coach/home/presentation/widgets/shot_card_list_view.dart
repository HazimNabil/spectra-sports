import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_stat_tile.dart';
import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/shot_analysis.dart';

class ShotCardListView extends StatelessWidget {
  final ShotAnalysis shotAnalysis;

  const ShotCardListView({super.key, required this.shotAnalysis});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ...List.generate(
          shotAnalysis.results.length,
          (index) => ShotCard(
            analysisResult: shotAnalysis.results[index],
          ),
        ),
        const SizedBox(height: 8),
        Divider(
          color: Colors.grey[400],
          indent: 16,
          endIndent: 16,
          thickness: 1.5,
        ),
        ShotStatTile(title: 'Total Shots', stat: shotAnalysis.totalShots),
        ShotStatTile(title: 'Total Goals', stat: shotAnalysis.totalGoals),
        ShotStatTile(title: 'Goal Probability', stat: shotAnalysis.goalProbability),
      ],
    );
  }
}
