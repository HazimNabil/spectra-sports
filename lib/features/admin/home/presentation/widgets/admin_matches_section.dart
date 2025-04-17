import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/match_card_list_view.dart';

class AdminMatchesSection extends StatelessWidget {
  final List<MatchModel> matches;
  final String teamId;

  const AdminMatchesSection({
    super.key,
    required this.matches,
    required this.teamId,
  });

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
            onPressed: () {
              context.push(AppRouter.addMatchRoute, extra: teamId);
            },
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
