import 'package:flutter/material.dart';

import 'package:spectra_sports/core/utils/app_colors.dart';

import 'package:spectra_sports/core/widgets/custom_button.dart';

import 'package:spectra_sports/features/admin/home/presentation/widgets/add_parent_details_form.dart';

class AddPlayer3 extends StatelessWidget {
  final void Function() onNext;

  const AddPlayer3({required this.onNext, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AddParentDetails(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: "Apply",
                onPressed: () => onNext(),
                color: AppColors.highlight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
