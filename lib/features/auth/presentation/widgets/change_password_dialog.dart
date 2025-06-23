import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: const Text('Change Password'),
      content: Column(
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
                AppValidators.requiredFieldValidator(password),
            onChanged: (password) {},
          ),
          CustomTextField(
            hintText: 'Confirm New Password',
            isPasswordField: true,
            validator: (password) =>
                AppValidators.requiredFieldValidator(password),
          ),
        ],
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
          onPressed: () {},
          child: const Text('Change'),
        ),
      ],
    );
  }
}
