import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team_response/player.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo_impl.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/position_prediction_cubit/position_prediction_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_player_card.dart';

class CoachPlayerCardListView extends StatelessWidget {
  final List<CoachPlayer> players;

  const CoachPlayerCardListView({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: players.length,
      itemBuilder: (_, index) {
        return BlocProvider(
          create: (context) => PositionPredictionCubit(
            locator<CoachHomeRepoImpl>(),
          ),
          child: CoachPlayerCard(
            player: players[index],
          ),
        );
      },
    );
  }
}
