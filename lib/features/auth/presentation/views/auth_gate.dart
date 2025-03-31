import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.buttons,
        ),
      ),
    );
  }
}
