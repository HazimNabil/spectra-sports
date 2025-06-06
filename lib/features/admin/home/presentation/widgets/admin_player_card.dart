import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class AdminPlayerCard extends StatelessWidget {
  final Player player;

  const AdminPlayerCard({super.key, required this.player});

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
          backgroundImage: CachedNetworkImageProvider(
            player.playerFaceUrl!,
          ),
        ),
        title: Text(
          player.shortName,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
      ),
    );
  }
}
