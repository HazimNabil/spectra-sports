import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/get_team_name_cubit/get_team_name_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_home_view_body.dart';

class CoachHomeView extends StatelessWidget {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<GetTeamNameCubit, GetTeamNameState>(
          builder: (context, state) {
            return switch (state) {
              GetTeamNameLoading() => const LoadingIndicator(),
              GetTeamNameSuccess(:final teamName) => CoachHomeViewBody(
                  teamName: teamName ?? '',
                ),
              GetTeamNameFailure(:final message) => Center(
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
