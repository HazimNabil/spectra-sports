import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/extensions.dart';

abstract class AppStyles {
  static TextStyle styleExtraBold24(BuildContext context) {
    return TextStyle(
      fontSize: 24 * context.width / 375,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: 20 * context.width / 375,
      fontWeight: FontWeight.bold,
      color: AppColors.input,
    );
  }

  static TextStyle styleBold15(BuildContext context) {
    return TextStyle(
      fontSize: 15 * context.width / 375,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: 16 * context.width / 375,
      fontWeight: FontWeight.w600,
      color: AppColors.highlight,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: 12 * context.width / 375,
      fontWeight: FontWeight.w600,
      color: AppColors.buttons,
    );
  }
}
