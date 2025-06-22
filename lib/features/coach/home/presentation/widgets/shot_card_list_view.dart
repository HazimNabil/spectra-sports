import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card.dart';

class ShotCardListView extends StatelessWidget {
  const ShotCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, index) {
        return const ShotCard();
      },
    );
  }
}