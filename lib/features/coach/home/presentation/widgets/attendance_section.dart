import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_card_list_view.dart';

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const Expanded(
          child: AttendanceCardListView(),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Take Attendance',
            color: AppColors.highlight,
            onPressed: () async {
              final imagePicker = ImagePicker();
              final image =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              final File? file;
              if (image != null) file = File(image.path);
            },
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
