import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/team_card_list_view.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 22,
      children: [
        CustomAppBar(
          title: 'Teams',
          showBackButton: false,
        ),
        Expanded(
          child: TeamCardListView(),
        ),
      ],
    );
  }
}
