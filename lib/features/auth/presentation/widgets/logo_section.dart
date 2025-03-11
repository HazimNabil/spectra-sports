import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/extensions.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.38,
      width: double.infinity,
      color: AppColors.logoBackground,
      child: Center(
        child: Image.asset(
          AppImages.imagesAppLogo,
        ),
      ),
    );
  }
}
