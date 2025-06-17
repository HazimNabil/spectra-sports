import 'package:flutter/material.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/parent_home_view_body.dart';

class ParentHomeView extends StatelessWidget {
  const ParentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: ParentHomeViewBody(),
      ),
    );
  }
}
