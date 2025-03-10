import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/splash/presentation/views/splash_view.dart';

class SpectraSports extends StatelessWidget {
  const SpectraSports({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spectra Sports',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: SplashView(),
    );
  }
}
