import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class PlayerSpecsSection0 extends StatelessWidget {
  const PlayerSpecsSection0({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          
          const SizedBox(
            height: 50,
          ),
          Title(color: AppColors.highlight, child: Text("Add Player")),
          Title(color: AppColors.highlight, child: Text("Player Specs")),
           Column(
                children: [
                  Text(
                    'Player Short Name',
                    style: AppStyles.styleSemiBold12(
                      context,
                    ).copyWith(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    
                    fieldWidth: 400,
                    hintText: 'Player Name',
                    validator: AppValidators.requiredFieldValidator,
                    onSaved: (defending) {},
                  ),],
              ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Weak Foot',
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
                    'Pace',
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
                        'Attacking',
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
                    'Weigt in kg',
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
                    'Hight In cm',
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
                    'Preferd Foot',
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
          ),
          
      
        ],
      ),
    );
  }
}
