import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';
import 'package:spectra_sports/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/login_form_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/logo_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_prompt_text.dart';
import 'package:toastification/toastification.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final LoginBodyModel loginBody;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    loginBody = LoginBodyModel();
    loginBody.role = 'admin';
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
              return Provider.value(
                value: loginBody,
                child: LoginFormSection(
                  formKey: _formKey,
                  autovalidateMode: value,
                ),
              );
            },
          ),
          const SizedBox(height: 55),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: loginListener,
              builder: (context, state) {
                return CustomButton(
                  title: 'Login',
                  color: AppColors.highlight,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<AuthCubit>().login(loginBody);
                    } else {
                      _autovalidateMode.value = AutovalidateMode.always;
                    }
                  },
                );
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

  void loginListener(BuildContext context, AuthState state) {
    switch (state) {
      case Authenticated(user: final user):
        showToast(
          context: context,
          title: 'You are logged in successfully',
          type: ToastificationType.success,
        );
        navigateByRole(user, context);
      case AuthFailure():
        showToast(
          context: context,
          title: state.message,
          type: ToastificationType.error,
        );
      default:
    }
  }
}
