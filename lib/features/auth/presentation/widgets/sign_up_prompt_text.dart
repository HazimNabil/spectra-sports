import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class SignUpPromptText extends StatelessWidget {
  const SignUpPromptText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Not a member? ',
            style: AppStyles.styleRegular14(
              context,
            ),
          ),
          TextSpan(
            text: 'Register Now',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(
              color: AppColors.highlight,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacement(AppRouter.signUpRoute),
          ),
        ],
      ),
    );
  }
}
