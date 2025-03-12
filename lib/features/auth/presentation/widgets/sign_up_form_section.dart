import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: AppStyles.styleSemiBold12(
            context,
          ).copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'Name'),
        const SizedBox(height: 24),
        Text(
          'Email Address',
          style: AppStyles.styleSemiBold12(
            context,
          ).copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const CustomTextField(hintText: 'name@gmail.com'),
        const SizedBox(height: 24),
        Text(
          'Password',
          style: AppStyles.styleSemiBold12(
            context,
          ).copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const CustomTextField(
          hintText: 'Create a password',
          isPasswordField: true,
        ),
        const SizedBox(height: 24),
        const CustomTextField(
          hintText: 'Confirm password',
          isPasswordField: true,
        ),
      ],
    );
  }
}
