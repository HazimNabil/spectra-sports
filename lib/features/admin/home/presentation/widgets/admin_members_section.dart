import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/coach_card.dart';

class AdminMembersSection extends StatelessWidget {
  const AdminMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          CoachCard(),
        ],
      ),
    );
  }
}
