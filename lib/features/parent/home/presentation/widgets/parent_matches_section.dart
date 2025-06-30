import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/widgets/match_card_list_view.dart';

class ParentMatchesSection extends StatelessWidget {
  final List<MatchModel> matches;

  const ParentMatchesSection({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return MatchCardListView(matches: matches);
  }
}
