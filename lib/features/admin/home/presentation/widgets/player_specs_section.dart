import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';

class PlayerSpecsSection extends StatelessWidget {
  const PlayerSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addPlayerInput = context.read<AddPlayerInput>();
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
            child: const Text("Player Specs"),
          ),
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
                    keyboardType: TextInputType.number,
                    onSaved: (defending) {
                      addPlayerInput.defending = int.parse(defending!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (dribbling) {
                      addPlayerInput.dribbling = int.parse(dribbling!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (passing) {
                      addPlayerInput.passing = int.parse(passing!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (physic) {
                      addPlayerInput.physic = int.parse(physic!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (shooting) {
                      addPlayerInput.shooting = int.parse(shooting!);
                    },
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
