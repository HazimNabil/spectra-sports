import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/coach/home/presentation/view_models/coach_matches_cubit/coach_matches_cubit.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_match_card_list_view.dart';

class CoachMatchesSection extends StatelessWidget {
  const CoachMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachMatchesCubit, CoachMatchesState>(
      builder: (context, state) {
        return switch (state) {
          CoachMatchesLoading() => const LoadingIndicator(),
          CoachMatchesSuccess(matches: final matches) => CoachMatchCardListView(
              matches: matches,
            ),
          CoachMatchesFailure(message: final message) => Center(
              child: Text(message),
            ),
          _ => const Placeholder(),
        };
      },
    );
  }
}
