import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome!',
            style: AppStyles.styleExtraBold24(context),
          ),
          const SizedBox(height: 24),
          const CustomTextField(hintText: 'Email Address'),
          const SizedBox(height: 16),
          const CustomTextField(hintText: 'Password', isPasswordField: true),
        ],
      ),
    );
  }
}
