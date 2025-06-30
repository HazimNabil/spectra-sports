import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/analysis_result.dart';

class ShotCard extends StatelessWidget {
  final AnalysisResult analysisResult;

  const ShotCard({super.key, required this.analysisResult});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          analysisResult.result,
          style: AppStyles.styleSemiBold16(context),
        ),
        trailing: Text(
          analysisResult.time,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
      ),
    );
  }
}
