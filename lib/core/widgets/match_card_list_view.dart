import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_match_card.dart';

class MatchCardListView extends StatelessWidget {
  const MatchCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, __) => const AdminMatchCard(),
    );
  }
}
