import 'package:flutter/material.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_attendance_card.dart';

class ParentAttendanceListVew extends StatelessWidget {
  const ParentAttendanceListVew({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (_, __) => const ParentAttendanceCard(),
    );
  }
}
