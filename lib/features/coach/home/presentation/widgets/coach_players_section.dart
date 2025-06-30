import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/get_team_cubit/get_team_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_player_card_list_view.dart';

class CoachPlayersSection extends StatelessWidget {
  const CoachPlayersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTeamCubit, GetTeamState>(
      builder: (context, state) {
        return switch (state) {
          GetTeamLoading() => const LoadingIndicator(),
          GetTeamSuccess(team: final team) => CoachPlayerCardListView(
              players: team.team?.players ?? [],
            ),
          GetTeamFailure(message: final message) => Center(
              child: Text(message),
            ),
          _ => const Placeholder(),
        };
      },
    );
  }
}
