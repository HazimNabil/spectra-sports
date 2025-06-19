import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team_response/player.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/position_prediction_cubit/position_prediction_cubit.dart';
import 'package:toastification/toastification.dart';

class CoachPlayerCard extends StatelessWidget {
  final CoachPlayer player;

  const CoachPlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.text,
          backgroundImage: CachedNetworkImageProvider(
            player.playerFaceUrl!,
          ),
        ),
        title: Text(
          player.shortName,
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.icons),
        ),
        trailing:
            BlocConsumer<PositionPredictionCubit, PositionPredictionState>(
          listener: (context, state) {
            if (state is PositionPredictionFailure) {
              showToast(
                context: context,
                title: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is PositionPredictionLoading) {
              return const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppColors.highlight,
                  strokeWidth: 3.5,
                ),
              );
            } else if (state is PositionPredictionSuccess) {
              return buildPlayerPositionWidget(context, state.position);
            }
            return buildPlayerPositionWidget(context, player.clubPosition);
          },
        ),
      ),
    );
  }

  Widget buildPlayerPositionWidget(BuildContext context, String? position) {
    if (position != null) {
      return Text(
        position,
        style: AppStyles.styleSemiBold16(
          context,
        ).copyWith(color: AppColors.icons),
      );
    }
    return IconButton(
      icon: Image.asset(AppImages.imagesPlayerPosition),
      onPressed: () async {
        final cubit = context.read<PositionPredictionCubit>();
        await cubit.predictPosition(
          player.shortName,
          PredictPositionInput.fromPlayer(player),
        );
      },
    );
  }
}
