import 'package:flutter/material.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/academy_info_view_body.dart';

class AcademyInfoView extends StatelessWidget {
  const AcademyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AcademyInfoViewBody(),
      ),
    );
  }
}
