import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee.dart';

class AttendanceCard extends StatelessWidget {
  final Attendee attendee;

  const AttendanceCard({super.key, required this.attendee});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          attendee.name!,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
        trailing: Image.asset(
          attendee.attendance!
              ? AppImages.imagesPresent
              : AppImages.imagesAbsent,
        ),
      ),
    );
  }
}
