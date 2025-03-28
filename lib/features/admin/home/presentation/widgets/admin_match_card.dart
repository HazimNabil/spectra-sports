import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class AdminMatchCard extends StatelessWidget {
  const AdminMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              '3 November 2022, 11.30',
              style: AppStyles.styleSemiBold16(context),
            ),
            Row(
              children: [
                Text(
                  'Team 1',
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
                const Spacer(),
                Text(
                  '-',
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
                const Spacer(),
                Text(
                  'Team 2',
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.icons),
                ),
              ],
            ),
            Visibility(
              visible: true,
              maintainState: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1',
                    style: AppStyles.styleExtraBold24(context),
                  ),
                  Text(
                    '0',
                    style: AppStyles.styleExtraBold24(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
