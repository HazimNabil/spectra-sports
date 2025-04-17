import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';

class AddParentDetails extends StatelessWidget {
  const AddParentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Title(color: AppColors.highlight, child: Text("Add Player")),
          Title(color: AppColors.highlight, child: Text("Parent Details")),
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
            'Parent Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Parent Name',
            validator: AppValidators.requiredFieldValidator,
            onSaved: (parentName) {},
          ),
          const SizedBox(height: 24),
          Text(
            'Parent Name',
            style: AppStyles.styleSemiBold12(
              context,
            ).copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'phone number',
            validator: AppValidators.requiredFieldValidator,
            onSaved: (phone) {},
          ),
          const SizedBox(height: 24),
          Text(
            'Parent Name',
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
            validator: AppValidators.passwordValidator,
            onSaved: (password) {},
          ),
          const SizedBox(height: 8),
          
        ],
      );
  }
}