import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class GoalkeeperSpecsSection extends StatelessWidget {
  const GoalkeeperSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Title(color: AppColors.highlight, child: Text("Add Player")),
          Title(color: AppColors.highlight, child: Text("GoalKeeper Specs")),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Speed',
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
                    'Diving',
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
                        'Handling',
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
                    'Kicking',
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
                    'Reflexes',
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
              Column(
                children: [
                  Text(
                    'Positioning',
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
      ),
    );
  }
}
