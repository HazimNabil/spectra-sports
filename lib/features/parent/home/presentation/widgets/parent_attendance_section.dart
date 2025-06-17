import 'package:flutter/material.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/attendance.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_attendance_list_view.dart';

class ParentAttendanceSection extends StatelessWidget {
  final List<Attendance> attendance;

  const ParentAttendanceSection({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return ParentAttendanceListVew(attendance: attendance);
  }
}
