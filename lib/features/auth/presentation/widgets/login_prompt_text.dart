import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class LoginPromptText extends StatelessWidget {
  const LoginPromptText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: AppStyles.styleRegular14(
              context,
            ),
          ),
          TextSpan(
            text: 'Login Now',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(
              color: AppColors.buttons,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacement(AppRouter.loginRoute),
          ),
        ],
      ),
    );
  }
}
