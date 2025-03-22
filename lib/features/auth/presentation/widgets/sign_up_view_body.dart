import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/login_prompt_text.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_form_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_title_section.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpTitleSection(),
          SignUpFormSection(
            formKey: _formKey,
            autovalidateMode: _autovalidateMode,
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomButton(
              title: 'Sign up',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  context.pushReplacement(AppRouter.academyInfoRoute);
                  setState(() => _autovalidateMode = AutovalidateMode.always);
                }
              },
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: LoginPromptText(),
          ),
        ],
      ),
    );
  }
}
