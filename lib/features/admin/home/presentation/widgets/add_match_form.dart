import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AddMatchForm extends StatelessWidget {
  const AddMatchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 42,
        children: [
          const CustomTextField(hintText: 'Match Name'),
          const CustomTextField(hintText: 'Match Date'),
          const CustomTextField(hintText: 'Opponent Team Name'),
          CustomButton(
            title: 'Select Match Date & Time',
            onPressed: () async {
              await selectDateTime(context);
            },
            color: AppColors.highlight,
          ),
        ],
      ),
    );
  }

  Future<void> selectDateTime(BuildContext context) async {
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
      final selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }
}
