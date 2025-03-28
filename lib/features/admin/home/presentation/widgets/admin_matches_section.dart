import 'package:flutter/material.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_match_card.dart';

class AdminMatchesSection extends StatelessWidget {
  const AdminMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AdminMatchCard(),
      ],
    );
  }
}
