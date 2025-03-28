import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
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
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpTitleSection(),
          ValueListenableBuilder(
            valueListenable: _autovalidateMode,
            builder: (_, value, __) {
              return SignUpFormSection(
                formKey: _formKey,
                autovalidateMode: value,
              );
            },
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomButton(
              title: 'Sign up',
              color: AppColors.buttons,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  context.go(AppRouter.adminHomeRoute);
                  _autovalidateMode.value = AutovalidateMode.always;
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
