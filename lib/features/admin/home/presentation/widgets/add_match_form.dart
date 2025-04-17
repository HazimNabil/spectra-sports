import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AddMatchForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  const AddMatchForm({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 42,
        children: [
          CustomTextField(
            hintText: 'Match Name',
            validator: (matchName) =>
                AppValidators.requiredFieldValidator(matchName),
          ),
          CustomTextField(
            hintText: 'Opponent Team Name',
            validator: (opponentTeam) =>
                AppValidators.requiredFieldValidator(opponentTeam),
          ),
          CustomButton(
            title: 'Select Match Date & Time',
            onPressed: () async => await selectDateTime(context),
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
      );

      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
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
