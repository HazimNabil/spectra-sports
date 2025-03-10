import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/app_router.dart';

class SpectraSports extends StatelessWidget {
  const SpectraSports({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Spectra Sports',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
