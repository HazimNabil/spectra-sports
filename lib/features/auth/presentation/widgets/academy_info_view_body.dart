import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class AcademyInfoViewBody extends StatelessWidget {
  const AcademyInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 48,
        children: [
          Text(
            'Academy Information',
            style: AppStyles.styleBold20(
              context,
            ).copyWith(color: AppColors.text),
          ),
        ],
      ),
    );
  }
}
