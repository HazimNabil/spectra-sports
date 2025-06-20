import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/fees_info.dart';

class NotPaidWidget extends StatelessWidget {
  const NotPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Outstanding Fees',
            style: AppStyles.styleExtraBold24(context),
          ),
          const SizedBox(height: 8),
          Text(
            'You have pending payments for your child\'s subscription.',
            style: AppStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.hint),
          ),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: const FeesInfo(),
          )
        ],
      ),
    );
  }
}
