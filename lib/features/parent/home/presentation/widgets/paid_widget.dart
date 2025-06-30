import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class PaidWidget extends StatelessWidget {
  const PaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.imagesPresent,
            height: 60,
            width: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 32),
          Text(
            'All Cleared!',
            style: AppStyles.styleExtraBold24(context),
          ),
          const SizedBox(height: 8),
          Text(
            'You have no outstanding payments. Thank you for keeping your payments up to date.',
            textAlign: TextAlign.center,
            style: AppStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.icons),
          ),
        ],
      ),
    );
  }
}
