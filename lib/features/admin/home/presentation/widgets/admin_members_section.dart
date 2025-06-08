import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/view_models/members_cubit/members_cubit.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/coach_card.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_player_card.dart';

class AdminMembersSection extends StatefulWidget {
  final String teamName;
  final String? coachName;

  const AdminMembersSection({
    super.key,
    required this.teamName,
    required this.coachName,
  });

  @override
  State<AdminMembersSection> createState() => _AdminMembersSectionState();
}

class _AdminMembersSectionState extends State<AdminMembersSection> {
  @override
  void initState() {
    super.initState();
    context.read<MembersCubit>().getMembers(widget.teamName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Expanded(
            child: BlocBuilder<MembersCubit, MembersState>(
              builder: (context, state) {
                return switch (state) {
                  MembersLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  MembersSuccess(players: final players) => ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        CoachCard(coachName: players[0].coachName!),
                        const SizedBox(height: 16),
                        ...List.generate(
                          players.length,
                          (index) => AdminPlayerCard(player: players[index]),
                        ),
                      ],
                    ),
                  MembersFailure(message: final message) => Center(
                      child: Text(message),
                    ),
                  _ => const Placeholder(),
                };
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Add Player',
                  color: AppColors.highlight,
                  onPressed: () {
                    context.push(
                      AppRouter.addPlayerRoute,
                      extra: (
                        widget.teamName,
                        widget.coachName,
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: widget.coachName?.isEmpty ?? true,
                child: const SizedBox(width: 32),
              ),
              Visibility(
                visible: widget.coachName?.isEmpty ?? true,
                child: Expanded(
                  child: CustomButton(
                    title: 'Add Coach',
                    color: AppColors.highlight,
                    onPressed: () {
                      context.push(
                        AppRouter.addCoachRoute,
                        extra: widget.teamName,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }
}
