import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';
import 'package:spectra_sports/core/utils/app_validators.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';

class PlayerSpecsSection0 extends StatefulWidget {
  const PlayerSpecsSection0({super.key});

  @override
  State<PlayerSpecsSection0> createState() => _PlayerSpecsSection0State();
}

class _PlayerSpecsSection0State extends State<PlayerSpecsSection0> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    final addPlayerInput = context.read<AddPlayerInput>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            child: const Text(
              "Player Specs",
            ),
          ),
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
                onSaved: (name) {
                  addPlayerInput.shortName = name;
                },
              ),
            ],
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
                    keyboardType: TextInputType.number,
                    onSaved: (weakFoot) {
                      addPlayerInput.weakFoot = int.parse(weakFoot!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (pace) {
                      addPlayerInput.pace = int.parse(pace!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (attacking) {
                      addPlayerInput.attackingCrossing = int.parse(attacking!);
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
                    'Weight in kg',
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
                    onSaved: (weight) {
                      addPlayerInput.weightKg = double.parse(weight!);
                    },
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
                    keyboardType: TextInputType.number,
                    onSaved: (height) {
                      addPlayerInput.heightCm = double.parse(height!);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Preferred Foot',
                    style: AppStyles.styleSemiBold12(
                      context,
                    ).copyWith(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 'right',
                            groupValue: _value,
                            onChanged: (value) {
                              addPlayerInput.preferredFoot = value;
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Right"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'left',
                            groupValue: _value,
                            onChanged: (value) {
                              addPlayerInput.preferredFoot = value;
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Left"),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
