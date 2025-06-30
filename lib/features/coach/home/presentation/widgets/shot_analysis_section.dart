import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/shot_analysis_cubit/shot_analysis_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/shot_card_list_view.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/upload_video_widget.dart';

class ShotAnalysisSection extends StatelessWidget {
  const ShotAnalysisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: BlocBuilder<ShotAnalysisCubit, ShotAnalysisState>(
            builder: (context, state) {
              return switch (state) {
                ShotAnalysisLoading() => const LoadingIndicator(),
                ShotAnalysisSuccess(:final shotAnalysis) => ShotCardListView(
                    shotAnalysis: shotAnalysis,
                  ),
                ShotAnalysisFailure(:final message) => Center(
                    child: Text(message),
                  ),
                _ => const UploadVideoWidget(),
              };
            },
          ),
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
                context.read<ShotAnalysisCubit>().analyzeShots(file);
              }
            },
          ),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
