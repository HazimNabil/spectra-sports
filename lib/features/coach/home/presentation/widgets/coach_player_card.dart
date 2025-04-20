import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CoachPlayerCard extends StatelessWidget {
  final Player player;

  const CoachPlayerCard({super.key, required this.player});

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
          backgroundImage: NetworkImage(
            player.playerFaceUrl,
          ),
        ),
        title: Text(
          player.shortName,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
        trailing: buildPlayerPositionWidget(context),
      ),
    );
  }

  Widget buildPlayerPositionWidget(BuildContext context) {
    if (player.clubPosition != null) {
      return Text(
        player.clubPosition!,
        style: AppStyles.styleSemiBold16(
          context,
        ).copyWith(color: AppColors.icons),
      );
    }
    return IconButton(
      icon: Image.asset(AppImages.imagesPlayerPosition),
      onPressed: () {},
    );
  }
}
