import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _turns = 0;

  @override
  void initState() {
    super.initState();
    rotate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedRotation(
        turns: _turns,
        duration: const Duration(seconds: 3),
        child: Image.asset(
          AppImages.imagesSplash,
        ),
      ),
    );
  }

  void rotate() {
    Future.delayed(
      const Duration(seconds: 0),
      () => setState(() => _turns = 1),
    );
  }
}
