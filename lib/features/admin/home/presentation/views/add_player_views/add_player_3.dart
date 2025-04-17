import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/add_parent_details_form.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';

class AddPlayer3 extends StatelessWidget {
  final void Function() onNext;
  const AddPlayer3({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const AddParentDetails(),
      CustomButton(
          title: "Apply", onPressed: () => onNext(), color: AppColors.text),
    ]));
  }
}
