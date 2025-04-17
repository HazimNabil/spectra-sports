import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/coach_card.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_player_card.dart';

class AdminMembersSection extends StatelessWidget {
  final List<Player> players;

  const AdminMembersSection({
    super.key,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CoachCard(coachName: players[0].coachName),
                const SizedBox(height: 12),
                ...List.generate(
                  players.length,
                  (index) => AdminPlayerCard(player: players[index]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: 'Add Player',
                color: AppColors.highlight,
                onPressed: () {
                  context.push(AppRouter.addPlayerRoute);
                },
              ),
              CustomButton(
                title: 'Add Coach',
                color: AppColors.highlight,
                onPressed: () {
                  
                },
              ),
            ],
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }
}
