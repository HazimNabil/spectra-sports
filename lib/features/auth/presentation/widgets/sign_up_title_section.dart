import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class SignUpTitleSection extends StatelessWidget {
  const SignUpTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign up',
          style: AppStyles.styleBold20(
            context,
          ).copyWith(color: AppColors.text),
        ),
        const SizedBox(height: 8),
        Text(
          'Create an account to get started',
          style: AppStyles.styleRegular14(context),
        ),
      ],
    );
  }
}
