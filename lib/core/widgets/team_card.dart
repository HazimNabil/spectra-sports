import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 10,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset(AppImages.imagesTeamLogo),
        title: Text(
          'Team 2010',
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: AppColors.hint,
          ),
        ),
      ),
    );
  }
}
