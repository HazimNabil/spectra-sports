import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.input,
      body: SplashViewBody(),
    );
  }
}
