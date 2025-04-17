import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_match_form.dart';

class AddMatchViewBody extends StatelessWidget {
  const AddMatchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add Match',
                  style: AppStyles.styleExtraBold24(context),
                ),
              ),
              const SizedBox(height: 48),
              const AddMatchForm(),
              const SizedBox.expand(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: 'Add',
                  color: AppColors.highlight,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
