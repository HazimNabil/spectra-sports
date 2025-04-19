import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';

class GoalkeeperSpecsSection extends StatelessWidget {
  const GoalkeeperSpecsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addPlayerInput = context.read<AddPlayerInput>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: const Text("GoalKeeper Specs"),
          ),
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
                    keyboardType: TextInputType.number,
                    onSaved: (speed) {
                      addPlayerInput.goalkeepingSpeed = int.parse(speed!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (diving) {
                      addPlayerInput.goalkeepingDiving = int.parse(diving!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (handling) {
                      addPlayerInput.goalkeepingHandling = int.parse(handling!);
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
                    keyboardType: TextInputType.number,
                    onSaved: (kicking) {
                      addPlayerInput.goalkeepingKicking = int.parse(kicking!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (reflexes) {
                      addPlayerInput.goalkeepingReflexes = int.parse(reflexes!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (positioning) {
                      addPlayerInput.goalkeepingPositioning =
                          int.parse(positioning!);
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
