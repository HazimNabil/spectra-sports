import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPasswordField;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.buttons,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(AppColors.buttons),
        hintText: hintText,
        hintStyle: AppStyles.styleRegular14(context),
        suffixIcon: isPasswordField ? const Icon(Icons.visibility) : null,
      ),
    );
  }

  OutlineInputBorder buildBorder([Color color = AppColors.text]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
