import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();

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
              onSaved: (password) {},
            ),
            CustomTextField(
              hintText: 'New Password',
              isPasswordField: true,
              validator: (password) =>
                  AppValidators.passwordValidator(password),
              onChanged: (password) {},
            ),
            const CustomTextField(
              hintText: 'Confirm New Password',
              isPasswordField: true,
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
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.highlight,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
