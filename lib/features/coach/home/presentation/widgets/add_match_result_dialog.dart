import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';

class AddMatchResultDialog extends StatefulWidget {
  final String matchId;

  const AddMatchResultDialog({super.key, required this.matchId});

  @override
  State<AddMatchResultDialog> createState() => _AddMatchResultDialogState();
}

class _AddMatchResultDialogState extends State<AddMatchResultDialog> {
  late final GlobalKey<FormState> _formKey;
  late final MatchResultBody _matchResultBody;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _matchResultBody = MatchResultBody(widget.matchId);
  }

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
              onSaved: (score) =>
                  _matchResultBody.team1Score = int.parse(score!),
            ),
            CustomTextField(
              hintText: 'Team 2 Score',
              keyboardType: TextInputType.number,
              validator: (score) => AppValidators.requiredFieldValidator(score),
              onSaved: (score) =>
                  _matchResultBody.team2Score = int.parse(score!),
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
