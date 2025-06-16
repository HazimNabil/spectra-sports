import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/attendance_card.dart';

class AttendanceCardListView extends StatelessWidget {
  final List<Attendee> attendees;

  const AttendanceCardListView({super.key, required this.attendees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: attendees.length,
      itemBuilder: (_, index) {
        return AttendanceCard(
          attendee: attendees[index],
        );
      },
    );
  }
}
