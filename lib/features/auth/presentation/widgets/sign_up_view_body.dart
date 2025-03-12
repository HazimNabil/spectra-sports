import 'package:flutter/material.dart';
import 'package:spectra_sports/features/auth/presentation/widgets/sign_up_title_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignUpTitleSection(),
          ],
        ),
      ),
    );
  }
}
