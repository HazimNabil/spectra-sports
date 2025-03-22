import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/utils/extensions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class AcademyInfoForm extends StatefulWidget {
  const AcademyInfoForm({super.key});

  @override
  State<AcademyInfoForm> createState() => _AcademyInfoFormState();
}

class _AcademyInfoFormState extends State<AcademyInfoForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academy Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Academy Name',
            validator: AppValidators.requiredFieldValidator,
          ),
          const SizedBox(height: 48),
          Text(
            'Academy Location',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: 'Academy location',
          ),
          const SizedBox(height: 48),
          Text(
            'Contact Number',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: '01077...',
            keyboardType: TextInputType.number,
            validator: AppValidators.phoneNumberValidator,
          ),
          SizedBox(height: context.height * 0.25),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: CustomButton(
              title: 'Save',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                } else {
                  setState(() => _autovalidateMode = AutovalidateMode.always);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
