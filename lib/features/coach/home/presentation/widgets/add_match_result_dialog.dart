import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AddMatchResultDialog extends StatelessWidget {
  const AddMatchResultDialog({super.key});

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
      content: const Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Team 1 Score',
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            hintText: 'Team 2 Score',
            keyboardType: TextInputType.number,
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
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
