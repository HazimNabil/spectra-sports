import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/match_card_list_view.dart';

class AdminMatchesSection extends StatelessWidget {
  final List<MatchModel> matches;

  const AdminMatchesSection({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: MatchCardListView(matches: matches),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Add Match',
            color: AppColors.highlight,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
