import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/app.dart';
import 'package:spectra_sports/core/di/service_locator.dart';
import 'package:spectra_sports/core/utils/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const SpectraSports(),
    ),
  );
}
