import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_coach_body.dart';

class AddCoachDetails extends StatelessWidget {
  final RegisterCoachBody registerCoachBody;

  const AddCoachDetails({super.key, required this.registerCoachBody});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Title(
            color: AppColors.highlight,
            child: Text(
              "Add coach",
              style: AppStyles.styleBold20(
                context,
              ).copyWith(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Title(
            color: AppColors.highlight,
            child: const Text("Coach Details"),
          ),
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
              registerCoachBody.email = email;
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
            onSaved: (coachName) {
              registerCoachBody.name = coachName;
            },
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
            validator: AppValidators.phoneNumberValidator,
            onSaved: (phoneNumber) {
              registerCoachBody.phoneNumber = phoneNumber;
            },
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
            onSaved: (password) {
              registerCoachBody.password = password;
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
