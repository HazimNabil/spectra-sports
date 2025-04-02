import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';
import 'package:spectra_sports/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/login_prompt_text.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_form_section.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_title_section.dart';
import 'package:toastification/toastification.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;
  late final SignUpBodyModel signUpBody;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    signUpBody = SignUpBodyModel();
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
              return Provider.value(
                value: signUpBody,
                child: SignUpFormSection(
                  formKey: _formKey,
                  autovalidateMode: value,
                ),
              );
            },
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: signUpListener,
              builder: (context, state) {
                return CustomButton(
                  title: 'Sign up',
                  color: AppColors.buttons,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<AuthCubit>().signUp(signUpBody);
                    } else {
                      _autovalidateMode.value = AutovalidateMode.always;
                    }
                  },
                );
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

  void signUpListener(BuildContext context, AuthState state) {
    switch (state) {
      case Authenticated():
        showToast(
          context: context,
          title: 'You registered successfully',
          type: ToastificationType.success,
        );
        context.go(AppRouter.adminHomeRoute);
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
