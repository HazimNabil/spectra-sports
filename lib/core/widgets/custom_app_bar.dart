import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/extensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140 * context.heightScaleFactor,
      decoration: BoxDecoration(
        color: AppColors.text.withAlpha(230),
        image: const DecorationImage(
          image: AssetImage(AppImages.imagesStadiumLights),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Teams',
        style: AppStyles.styleExtraBold30(context),
      ),
    );
  }
}
