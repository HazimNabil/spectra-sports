import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class UploadVideoWidget extends StatelessWidget {
  const UploadVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.upload_file,
            size: 75,
            color: AppColors.highlight,
          ),
          Text(
            'Upload a match video to analyze shots',
            style: AppStyles.styleSemiBold16(context).copyWith(
              color: AppColors.text,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
