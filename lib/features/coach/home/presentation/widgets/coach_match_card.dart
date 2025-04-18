import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/match_result.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/coach_matches_cubit/coach_matches_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/add_match_result_dialog.dart';

class CoachMatchCard extends StatelessWidget {
  final MatchModel match;

  const CoachMatchCard({super.key, required this.match});

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
          spacing: 16,
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
              visible: match.date
                  .add(const Duration(minutes: 90))
                  .isBefore(DateTime.now()),
              maintainState: false,
              child: displayMatchResult(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayMatchResult(BuildContext context) {
    if (match.team1Score == null && match.team2Score == null) {
      return Align(
        child: CustomButton(
          title: 'Add Result',
          onPressed: () => showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<CoachMatchesCubit>(),
                child: AddMatchResultDialog(
                  match: match,
                ),
              );
            },
          ),
          color: AppColors.highlight,
        ),
      );
    } else {
      return MatchResult(
        team1Score: match.team1Score,
        team2Score: match.team2Score,
      );
    }
  }
}
