import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/extensions.dart';

abstract class AppStyles {
  static TextStyle styleExtraBold24(BuildContext context) {
    return TextStyle(
      fontSize: 24 * context.widthScaleFactor,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    );
  }

  static TextStyle styleExtraBold30(BuildContext context) {
    return TextStyle(
      fontSize: 30 * context.widthScaleFactor,
      fontWeight: FontWeight.w800,
      color: AppColors.background,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: 14 * context.widthScaleFactor,
      fontWeight: FontWeight.normal,
      color: AppColors.hint,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: 20 * context.widthScaleFactor,
      fontWeight: FontWeight.bold,
      color: AppColors.background,
    );
  }

  static TextStyle styleBold15(BuildContext context) {
    return TextStyle(
      fontSize: 15 * context.widthScaleFactor,
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: 16 * context.widthScaleFactor,
      fontWeight: FontWeight.w600,
      color: AppColors.highlight,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: 12 * context.widthScaleFactor,
      fontWeight: FontWeight.w600,
      color: AppColors.buttons,
    );
  }
}
