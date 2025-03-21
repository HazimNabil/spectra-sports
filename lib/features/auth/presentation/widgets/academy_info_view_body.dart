import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/academy_info_form.dart';

class AcademyInfoViewBody extends StatelessWidget {
  const AcademyInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 48,
          children: [
            Text(
              'Academy Information',
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text),
            ),
            const AcademyInfoForm(),
          ],
        ),
      ),
    );
  }
}
