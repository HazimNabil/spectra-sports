import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CoachPlayerCard extends StatelessWidget {
  const CoachPlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.text,
          backgroundImage: NetworkImage(
            'https://cdn.sofifa.net/players/242/516/22_120.png',
          ),
        ),
        title: Text(
          'Cody Gakpo',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
        trailing: Text(
          'LW',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
      ),
    );
  }
}
