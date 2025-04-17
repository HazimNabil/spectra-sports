import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final double fieldWidth;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.fieldWidth=100, //screen width
    this.isPasswordField = false,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth,
      child: TextFormField(
        
        cursorColor: AppColors.buttons,
        obscureText: widget.isPasswordField && _obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
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
