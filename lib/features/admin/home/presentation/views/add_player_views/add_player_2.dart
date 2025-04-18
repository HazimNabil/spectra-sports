import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section.dart';

class AddPlayer2 extends StatelessWidget {
  final void Function() onNext;
  const AddPlayer2({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PlayerSpecsSection(),
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
      ),
    );
  }
}
