import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/match_card_list_view.dart';

class ParentMatchesSection extends StatelessWidget {
  const ParentMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const MatchCardListView(matches: []);
  }
}
