import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AddMatchResultDialog extends StatefulWidget {
  const AddMatchResultDialog({super.key});

  @override
  State<AddMatchResultDialog> createState() => _AddMatchResultDialogState();
}

class _AddMatchResultDialogState extends State<AddMatchResultDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Text(
        'Add Match Result',
        style: AppStyles.styleBold20(
          context,
        ).copyWith(color: AppColors.text),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              hintText: 'Team 1 Score',
              keyboardType: TextInputType.number,
              validator: (score) => AppValidators.requiredFieldValidator(score),
            ),
            CustomTextField(
              hintText: 'Team 2 Score',
              keyboardType: TextInputType.number,
              validator: (score) => AppValidators.requiredFieldValidator(score),
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
              context.pop();
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
