import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
    this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.buttons,
      obscureText: widget.isPasswordField && _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        border: buildBorder(),
        focusedBorder: buildBorder(AppColors.buttons),
        hintText: widget.hintText,
        hintStyle: AppStyles.styleRegular14(context),
        suffixIcon: Visibility(
          visible: widget.isPasswordField,
          child: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
        ),
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
