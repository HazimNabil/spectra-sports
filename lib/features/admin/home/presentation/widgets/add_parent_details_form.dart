import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_parent_body.dart';

class AddParentDetails extends StatelessWidget {
  const AddParentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final registerParentBody = context.read<RegisterParentBody>();
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
            child: Text(
              "Add Player",
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.text, fontWeight: FontWeight.bold),
            ),
          ),
          Title(
            color: AppColors.highlight,
            child: const Text("Parent Details"),
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
              registerParentBody.email = email;
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
            onSaved: (parentName) {
              registerParentBody.name = parentName;
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Phone Number',
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
            onSaved: (phone) {
              registerParentBody.phoneNumber = phone;
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
              registerParentBody.password = password;
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
