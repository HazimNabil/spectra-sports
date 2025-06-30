import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/parent/home/presentation/view_models/parent_players_cubit/parent_players_cubit.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_home_view_body.dart';

class ParentHomeView extends StatelessWidget {
  const ParentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<ParentPlayersCubit, ParentPlayersState>(
          builder: (context, state) {
            return switch (state) {
              ParentPlayersLoading() => const LoadingIndicator(),
              ParentPlayersSuccess(:final playersData) => ParentHomeViewBody(
                  playersData: playersData[0],
                ),
              ParentPlayersFailure(:final message) => Center(
                  child: Text(message),
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
