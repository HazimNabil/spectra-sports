import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card_list_view.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class ShotAnalysisSection extends StatelessWidget {
  const ShotAnalysisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const Expanded(
          child: ShotCardListView(),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Analyze Shots',
            color: AppColors.highlight,
            onPressed: () async {
              final imagePicker = ImagePicker();
              final video =
                  await imagePicker.pickVideo(source: ImageSource.gallery);
              File? file;
              if (video != null) file = File(video.path);
              if (file != null && context.mounted) {
                // Trigger ShotAnalysisCubit
              }
            },
          ),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
