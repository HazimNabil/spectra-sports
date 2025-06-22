import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card.dart';

class ShotAnalysisSection extends StatelessWidget {
  const ShotAnalysisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ShotCard(),
      ],
    );
  }
}
