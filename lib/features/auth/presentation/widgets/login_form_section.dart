import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: _autovalidateMode,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: AppStyles.styleExtraBold24(context),
            ),
            const SizedBox(height: 24),
            const CustomTextField(
              hintText: 'Email Address',
              validator: AppValidators.emailValidator,
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              hintText: 'Password',
              isPasswordField: true,
              validator: AppValidators.passwordValidator,
            ),
            const SizedBox(height: 55),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: CustomButton(
                title: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  } else {
                    setState(() => _autovalidateMode = AutovalidateMode.always);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
