import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/attendance.dart';

class ParentAttendanceCard extends StatelessWidget {
  final Attendance attendance;

  const ParentAttendanceCard({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          '${attendance.date.day}/${attendance.date.month}/${attendance.date.year}',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
        trailing: attendance.present
            ? Image.asset(AppImages.imagesPresent)
            : Image.asset(AppImages.imagesAbsent),
      ),
    );
  }
}
