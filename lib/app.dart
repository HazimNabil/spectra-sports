import 'package:flutter/material.dart';

import 'features/splash/presentation/views/splash_view.dart';

class SpectraSports extends StatelessWidget {
  const SpectraSports({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spectra Sports',
      home: SplashView(),
    );
  }
}
