import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

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
          CustomTextField(
            hintText: 'Name',
            validator: nameValidator,
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
            validator: emailValidator,
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
            validator: passwordValidator,
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

  String? passwordValidator(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Please enter your password';
    } else if (password!.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? emailValidator(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email?.isEmpty ?? true) {
      return 'Please enter your email address';
    } else if (!emailRegex.hasMatch(email!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? nameValidator(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Please enter your name';
    }
    return null;
  }
}
