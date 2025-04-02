import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';

class SignUpFormSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  const SignUpFormSection({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
          CustomTextField(
            hintText: 'Name',
            validator: AppValidators.requiredFieldValidator,
            onSaved: (name) {
              context.read<SignUpBodyModel>().name = name;
            },
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
          CustomTextField(
            hintText: 'name@gmail.com',
            validator: AppValidators.emailValidator,
            onSaved: (email) {
              context.read<SignUpBodyModel>().email = email;
            },
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
          CustomTextField(
            hintText: 'Create a password',
            isPasswordField: true,
            validator: AppValidators.passwordValidator,
            onChanged: (password) {
              context.read<SignUpBodyModel>().password = password;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            hintText: 'Confirm password',
            isPasswordField: true,
            validator: (password) {
              if (password != context.read<SignUpBodyModel>().password) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Secret Code',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'secret code',
            isPasswordField: true,
            validator: AppValidators.requiredFieldValidator,
            onChanged: (secretCode) {
              context.read<SignUpBodyModel>().secretCode = secretCode;
            },
          ),
        ],
      ),
    );
  }
}
