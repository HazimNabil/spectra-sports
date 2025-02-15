import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.imagesSplash,
      ),
    );
  }
}
