import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class ShotStatTile extends StatelessWidget {
  final String title;
  final num stat;

  const ShotStatTile({super.key, required this.title, required this.stat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.styleSemiBold16(context).copyWith(
          color: AppColors.text,
        ),
      ),
      trailing: Text(
        stat.toString(),
        style: AppStyles.styleSemiBold16(context),
      ),
    );
  }
}
