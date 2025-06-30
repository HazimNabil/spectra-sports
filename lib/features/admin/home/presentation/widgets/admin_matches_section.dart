import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/match_card_list_view.dart';
import 'package:spectra_sports/core/widgets/loading_indicator.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/add_match_cubit/admin_matches_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_bottom_sheet.dart';

class AdminMatchesSection extends StatelessWidget {
  final String teamId;

  const AdminMatchesSection({
    super.key,
    required this.teamId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: BlocBuilder<AdminMatchesCubit, AdminMatchesState>(
            builder: (context, state) {
              return switch (state) {
                AdminMatchesLoading() => const LoadingIndicator(),
                AdminMatchesSuccess(:final matches) => MatchCardListView(
                    matches: matches,
                  ),
                AdminMatchesFailure(:final message) => Center(
                    child: Text(message),
                  ),
                _ => const Placeholder(),
              };
            },
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Add Match',
            color: AppColors.highlight,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.background,
                isScrollControlled: true,
                builder: (bottomSheetContext) => BlocProvider.value(
                  value: context.read<AdminMatchesCubit>(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: bottomSheetContext.keyboardHeight,
                    ),
                    child: IntrinsicHeight(
                      child: AddMatchBottomSheet(teamId: teamId),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
