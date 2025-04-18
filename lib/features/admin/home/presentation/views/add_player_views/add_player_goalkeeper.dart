import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/goalkeeper_specs_section.dart';

class AddPlayerGoalkeeper extends StatelessWidget {
  final void Function() onNext;
  const AddPlayerGoalkeeper({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const GoalkeeperSpecsSection(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                  title: "Next",
                  onPressed: () => onNext(),
                  color: AppColors.highlight),
            ),
          )
        ],
      ),
    );
  }
}
