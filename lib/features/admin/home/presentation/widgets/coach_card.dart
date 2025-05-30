import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CoachCard extends StatelessWidget {
  final String coachName;

  const CoachCard({super.key, required this.coachName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.text,
          child: Text(
            'C',
            style: AppStyles.styleBold20(context),
          ),
        ),
        title: Text(
          coachName,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
      ),
    );
  }
}
