import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class PlayerSpecsSection extends StatelessWidget {
  const PlayerSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 50,
        ),
        Title(color: AppColors.highlight, child: Text("Add Player")),
        Title(color: AppColors.highlight, child: Text("Player Specs")),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Defending',
                  style: AppStyles.styleSemiBold12(
                    context,
                  ).copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  
                  fieldWidth: 100,
                  hintText: '0',
                  validator: AppValidators.requiredFieldValidator,
                  onSaved: (defending) {},
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Dribbling',
                  style: AppStyles.styleSemiBold12(
                    context,
                  ).copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  fieldWidth: 100,
                  hintText: '0',
                  validator: AppValidators.requiredFieldValidator,
                  onSaved: (dribbling) {},
                ),
               
              ],
            ),
             Column(
                  children: [
                    Text(
                      'Passing',
                      style: AppStyles.styleSemiBold12(
                        context,
                      ).copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      fieldWidth: 100,
                      hintText: '0',
                      validator: AppValidators.requiredFieldValidator,
                      onSaved: (passing) {},
                    ),
                  ],
                ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Physic',
                  style: AppStyles.styleSemiBold12(
                    context,
                  ).copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  fieldWidth: 100,
                  hintText: '0',
                  validator: AppValidators.requiredFieldValidator,
                  onSaved: (physic) {},
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Shooting',
                  style: AppStyles.styleSemiBold12(
                    context,
                  ).copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  fieldWidth: 100,
                  hintText: '0',
                  validator: AppValidators.requiredFieldValidator,
                  onSaved: (shooting) {},
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
