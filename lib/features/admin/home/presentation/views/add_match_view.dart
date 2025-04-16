import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_form.dart';

class AddMatchView extends StatelessWidget {
  const AddMatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 32,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Add Match',
                    style: AppStyles.styleExtraBold24(context),
                  ),
                ),
                const AddMatchForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
