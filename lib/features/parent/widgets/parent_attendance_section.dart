import 'package:flutter/material.dart';
import 'package:spectra_sports/features/parent/widgets/parent_attendance_list_view.dart';

class ParentAttendanceSection extends StatelessWidget {
  const ParentAttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ParentAttendanceListVew(),

    ) ;
  }
}