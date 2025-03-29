import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_card_list_view.dart';

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Expanded(
            child: AttendanceCardListView(),
          ),
        ],
      ),
    );
  }
}
