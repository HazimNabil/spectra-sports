import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class FeesInfo extends StatelessWidget {
  const FeesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Amount:',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text),
            ),
            const Spacer(),
            Text(
              '1000.00 EGP',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Text(
              'Due Date:',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text),
            ),
            const Spacer(),
            Text(
              '15-${DateTime.now().month}-${DateTime.now().year}',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text),
            ),
          ],
        )
      ],
    );
  }
}
