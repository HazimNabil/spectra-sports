import 'package:flutter/material.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/logo_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LogoSection(),
        ],
      ),
    );
  }
}
