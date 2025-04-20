import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_coach_details.dart';

class AddCoachView extends StatelessWidget {
  const AddCoachView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        const AddCoachDetails(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
                title: "Apply", onPressed: () {}, color: AppColors.highlight),
          ),
        ),
      ])),
    );
  }
}
