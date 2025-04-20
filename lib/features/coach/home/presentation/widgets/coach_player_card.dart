import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_images.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/position_prediction_cubit/position_prediction_cubit.dart';
import 'package:toastification/toastification.dart';

class CoachPlayerCard extends StatelessWidget {
  final Player player;

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
          backgroundImage: NetworkImage(
            player.playerFaceUrl,
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
              return const CircularProgressIndicator();
            } else if (state is PositionPredictionSuccess) {
              return buildPlayerPositionWidget(context, state.position);
            } else {
              return buildPlayerPositionWidget(context, player.clubPosition);
            }
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
      onPressed: () {},
    );
  }
}
