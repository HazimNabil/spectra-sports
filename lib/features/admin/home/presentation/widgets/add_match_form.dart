import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';

class AddMatchForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final AddMatchInput addMatchInput;

  const AddMatchForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
    required this.addMatchInput,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            hintText: 'Match Name',
            validator: (matchName) =>
                AppValidators.requiredFieldValidator(matchName),
            onSaved: (matchName) => addMatchInput.matchName = matchName,
          ),
          CustomTextField(
            hintText: 'Opponent Team Name',
            validator: (opponentTeam) =>
                AppValidators.requiredFieldValidator(opponentTeam),
            onSaved: (opponentTeam) => addMatchInput.team2 = opponentTeam,
          ),
          CustomButton(
            title: 'Select Match Date & Time',
            onPressed: () async {
              addMatchInput.date = await selectDateTime(context);
            },
            color: AppColors.highlight,
          ),
        ],
      ),
    );
  }

  Future<DateTime> selectDateTime(BuildContext context) async {
    DateTime? selectedDateTime;
    do {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        builder: (context, child) {
          final colorScheme = Theme.of(context).colorScheme;

          return Theme(
            data: Theme.of(context).copyWith(
              datePickerTheme: const DatePickerThemeData(
                backgroundColor: AppColors.background,
              ),
              colorScheme: colorScheme.copyWith(
                primary: AppColors.highlight,
              ),
            ),
            child: child!,
          );
        },
      );

      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          final colorScheme = Theme.of(context).colorScheme;

          return Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: const TimePickerThemeData(
                backgroundColor: AppColors.background,
              ),
              colorScheme: colorScheme.copyWith(
                primary: AppColors.highlight,
                primaryContainer: AppColors.highlight.withAlpha(20),
                onPrimaryContainer: AppColors.highlight,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null && pickedTime != null) {
        selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        return selectedDateTime;
      }
    } while (selectedDateTime == null);

    return selectedDateTime;
  }
}
