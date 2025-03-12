import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
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
            CustomTextField(
              hintText: 'Email Address',
              validator: emailValidator,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Password',
              isPasswordField: true,
              validator: passwordValidator,
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
}
