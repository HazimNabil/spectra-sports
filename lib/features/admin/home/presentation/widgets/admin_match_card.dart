import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/match_result.dart';

class AdminMatchCard extends StatelessWidget {
  final MatchModel match;

  const AdminMatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              match.status!,
              style: AppStyles.styleSemiBold16(context),
            ),
            Row(
              children: [
                Text(
                  match.team1,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
                const Spacer(),
                Text(
                  '-',
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
                const Spacer(),
                Text(
                  match.team2,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
              ],
            ),
            Visibility(
              visible: match.team1Score != null && match.team2Score != null,
              maintainState: false,
              child: MatchResult(
                team1Score: match.team1Score,
                team2Score: match.team2Score,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
