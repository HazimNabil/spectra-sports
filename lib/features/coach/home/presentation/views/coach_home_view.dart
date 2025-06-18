import 'package:flutter/material.dart';
import 'package:spectra_sports/features/coach/home/presentation/widgets/coach_home_view_body.dart';

class CoachHomeView extends StatelessWidget {
  const CoachHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CoachHomeViewBody(),
      ),
    );
  }
}
