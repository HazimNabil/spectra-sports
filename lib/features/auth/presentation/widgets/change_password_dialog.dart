import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/auth/data/models/change_password_body.dart';
import 'package:spectra_sports/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:toastification/toastification.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _changePasswordBody = ChangePasswordBody();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: const Text('Change Password'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            CustomTextField(
              hintText: 'Current Password',
              isPasswordField: true,
              validator: (password) =>
                  AppValidators.requiredFieldValidator(password),
              onSaved: (oldPassword) {
                _changePasswordBody.oldPassword = oldPassword;
              },
            ),
            CustomTextField(
              hintText: 'New Password',
              isPasswordField: true,
              validator: (password) =>
                  AppValidators.passwordValidator(password),
              onChanged: (newPassword) {
                _changePasswordBody.newPassword = newPassword;
              },
            ),
            CustomTextField(
              hintText: 'Confirm New Password',
              isPasswordField: true,
              validator: (confirmPassword) {
                if (confirmPassword?.isEmpty ?? true) {
                  return 'This field is required';
                } else if (confirmPassword != _changePasswordBody.newPassword) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onChanged: (confirmPassword) {
                _changePasswordBody.confirmPassword = confirmPassword;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.highlight,
          ),
          onPressed: () => context.pop(),
          child: const Text('Cancel'),
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is PasswordChange) {
              context.pop();
              showToast(
                context: context,
                title: state.message,
                type: ToastificationType.success,
              );
              context.pop();
            } else if (state is AuthFailure) {
              context.pop();
              showToast(
                context: context,
                title: state.message,
                type: ToastificationType.error,
              );
            } else if (state is AuthLoading) {
              showDialog(
                context: context,
                builder: (context) => const LoadingIndicator(),
              );
            }
          },
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.highlight,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<AuthCubit>().changePassword(_changePasswordBody);
              }
            },
            child: const Text('Change'),
          ),
        ),
      ],
    );
  }
}
