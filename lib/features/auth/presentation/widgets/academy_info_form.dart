import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AcademyInfoForm extends StatelessWidget {
  const AcademyInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academy Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Name',
          ),
          const SizedBox(height: 48),
          Text(
            'Academy Address',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Google Maps link',
          ),
          const SizedBox(height: 48),
          Text(
            'Contact Number',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Contact Number',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
