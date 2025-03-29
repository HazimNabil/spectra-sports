import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_card.dart';

class AttendanceCardListView extends StatelessWidget {
  const AttendanceCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, __) => const AttendanceCard(),
    );
  }
}
