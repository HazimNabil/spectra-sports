import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Welcome!',
            style: AppStyles.styleExtraBold24(context),
          ),
        ],
      ),
    );
  }
}
