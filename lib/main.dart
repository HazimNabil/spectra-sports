import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spectra_sports/app.dart';
import 'package:spectra_sports/core/di/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const SpectraSports(),
    ),
  );
}
