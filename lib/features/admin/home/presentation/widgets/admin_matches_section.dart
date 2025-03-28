import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/admin_match_card_list_view.dart';

class AdminMatchesSection extends StatelessWidget {
  const AdminMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const Expanded(
          child: AdminMatchCardListView(),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Add Match',
            color: AppColors.highlight,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
