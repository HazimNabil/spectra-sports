import 'package:flutter/material.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/attendance.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_attendance_card.dart';

class ParentAttendanceListVew extends StatelessWidget {
  final List<Attendance> attendance;

  const ParentAttendanceListVew({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: attendance.length,
      itemBuilder: (_, index) {
        return ParentAttendanceCard(
          attendance: attendance[index],
        );
      },
    );
  }
}
