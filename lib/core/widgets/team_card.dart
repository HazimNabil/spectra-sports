import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
      elevation: 4,
      child: ListTile(
        onTap: () => context.push(AppRouter.adminTeamRoute),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset(AppImages.imagesTeamLogo),
        title: Text(
          'Team 2010',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.hint),
        ),
      ),
    );
  }
}
