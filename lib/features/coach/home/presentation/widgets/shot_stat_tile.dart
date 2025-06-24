import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class ShotStatTile extends StatelessWidget {
  final ({String title, String value}) stat;

  const ShotStatTile({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        stat.title,
        style: AppStyles.styleSemiBold16(context).copyWith(
          color: AppColors.text,
        ),
      ),
      trailing: Text(
        stat.value,
        style: AppStyles.styleSemiBold16(context),
      ),
    );
  }
}
