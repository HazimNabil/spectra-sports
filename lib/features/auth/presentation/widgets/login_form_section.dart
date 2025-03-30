import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/role_drop_down_button.dart';

class LoginFormSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  const LoginFormSection({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
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
            const SizedBox(height: 16),
            const RoleDropDownButton(),
          ],
        ),
      ),
    );
  }
}
