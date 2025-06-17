import 'package:flutter/material.dart';
import 'package:spectra_sports/core/widgets/custom_app_bar.dart';
import 'package:spectra_sports/core/widgets/custom_tab_bar.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_attendance_section.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_matches_section.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_payment_section.dart';

class ParentHomeViewBody extends StatelessWidget {
  const ParentHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: "Player Name",
          showBackButton: false,
        ), // change player name
        SizedBox(
          height: 16,
        ),
        CustomTabBar(tabs: ['Match', 'Attendance', 'Payment']),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ParentMatchesSection(),
              ParentAttendanceSection(),
              ParentPaymentSection(),
            ],
          ),
        ),
      ],
    );
  }
}
