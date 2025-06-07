import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/attendance_cubit/attendance_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_card_list_view.dart';

class AttendanceSection extends StatefulWidget {
  const AttendanceSection({super.key});

  @override
  State<AttendanceSection> createState() => _AttendanceSectionState();
}

class _AttendanceSectionState extends State<AttendanceSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              return switch (state) {
                AttendanceLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                AttendanceSuccess(attendees: final attendees) =>
                  AttendanceCardListView(
                    attendees: attendees,
                  ),
                AttendanceFailure(message: final message) => Center(
                    child: Text(message),
                  ),
                _ => Center(
                    child: Text(
                      'You haven\'t taken any attendance yet',
                      style: AppStyles.styleBold15(context).copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  ),
              };
            },
          ),
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
              File? file;
              if (image != null) file = File(image.path);
              if (file != null && context.mounted) {
                await context.read<AttendanceCubit>().takeAttendance(file);
              }
            },
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
