import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Name',
            validator: AppValidators.requiredFieldValidator,
          ),
          const SizedBox(height: 24),
          Text(
            'Email Address',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'name@gmail.com',
            validator: AppValidators.emailValidator,
          ),
          const SizedBox(height: 24),
          Text(
            'Password',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Create a password',
            isPasswordField: true,
            validator: AppValidators.passwordValidator,
          ),
          const SizedBox(height: 24),
          const CustomTextField(
            hintText: 'Confirm password',
            isPasswordField: true,
          ),
          const SizedBox(height: 55),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomButton(
              title: 'Sign up',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  context.pushReplacement(AppRouter.academyInfoRoute);
                  // setState(() => _autovalidateMode = AutovalidateMode.always);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
