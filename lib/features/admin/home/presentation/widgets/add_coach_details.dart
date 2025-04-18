import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';

class AddCoachDetails extends StatelessWidget {
  const AddCoachDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Title(
              color: AppColors.highlight,
              child: Text("Add coach",
                  style: AppStyles.styleBold20(context).copyWith(
                      color: AppColors.text, fontWeight: FontWeight.bold))),
          Title(color: AppColors.highlight, child: Text("Coach Details")),
          const SizedBox(height: 24),
          Text(
            'Email Address',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'name@gmail.com',
            validator: AppValidators.emailValidator,
            onSaved: (email) {
              context.read<SignUpBodyModel>().email = email;
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Coach Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Coach Name',
            validator: AppValidators.requiredFieldValidator,
            onSaved: (parentName) {},
          ),
          const SizedBox(height: 24),
          Text(
            'Coach Phone Number',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: '01099362016',
            onSaved: (parentName) {},
          ),
          const SizedBox(height: 24),
          Text(
            'Password',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Password',
            isPasswordField: true,
            validator: AppValidators.passwordValidator,
            onSaved: (password) {},
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
