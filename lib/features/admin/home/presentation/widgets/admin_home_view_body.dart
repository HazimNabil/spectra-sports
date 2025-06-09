import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/team_card_list_view.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/get_teams_cubit/get_teams_cubit.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22,
      children: [
        const CustomAppBar(
          title: 'Teams',
          showBackButton: false,
        ),
        Expanded(
          child: BlocBuilder<GetTeamsCubit, GetTeamsState>(
            builder: (context, state) {
              return switch (state) {
                GetTeamsLoading() => const LoadingIndicator(),
                GetTeamsSuccess(teams: final teams) => TeamCardListView(
                  teams: teams,
                ),
                GetTeamsFailure(message: final message) => Center(
                    child: Text(message),
                  ),
                _ => const Placeholder(),
              };
            },
          ),
        ),
      ],
    );
  }
}
