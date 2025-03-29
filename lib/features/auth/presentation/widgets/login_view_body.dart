import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LogoSection(),
          const SizedBox(height: 40),
          ValueListenableBuilder(
            valueListenable: _autovalidateMode,
            builder: (_, value, __) {
              return LoginFormSection(
                formKey: _formKey,
                autovalidateMode: value,
              );
            },
          ),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              title: 'Login',
              color: AppColors.buttons,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  context.go(AppRouter.coachHomeRoute);
                  _autovalidateMode.value = AutovalidateMode.always;
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
