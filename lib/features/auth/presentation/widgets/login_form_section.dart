import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_prompt_text.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

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
          const SizedBox(height: 55),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomButton(title: 'Login', onPressed: () {}),
          ),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.center,
            child: SignUpPromptText(),
          )
        ],
      ),
    );
  }
}
