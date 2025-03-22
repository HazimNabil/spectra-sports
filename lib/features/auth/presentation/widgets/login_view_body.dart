import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/login_form_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/logo_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_prompt_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoSection(),
          const SizedBox(height: 40),
          LoginFormSection(
            formKey: _formKey,
            autovalidateMode: _autovalidateMode,
          ),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
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
          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.center,
            child: SignUpPromptText(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
