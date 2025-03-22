import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AcademyInfoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  const AcademyInfoForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
            hintText: 'Academy Name',
            validator: AppValidators.requiredFieldValidator,
          ),
          const SizedBox(height: 48),
          Text(
            'Academy Location',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Academy location',
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
            hintText: '01077...',
            keyboardType: TextInputType.number,
            validator: AppValidators.phoneNumberValidator,
          ),
        ],
      ),
    );
  }
}
