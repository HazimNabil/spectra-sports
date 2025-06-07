import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';

import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section0.dart';

class AddPlayer1 extends StatefulWidget {
  final void Function(bool) onNext;

  const AddPlayer1({required this.onNext, super.key});

  @override
  State<AddPlayer1> createState() => _AddPlayer1State();
}

class _AddPlayer1State extends State<AddPlayer1> {
  late bool _isGoalKeeper;
  late final GlobalKey<FormState> _formKey;
  late final AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _isGoalKeeper = false;
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                const PlayerSpecsSection0(),
                CheckboxListTile(
                  value: _isGoalKeeper,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isGoalKeeper = newValue!;
                    });
                  },
                  activeColor: AppColors.highlight,
                  checkColor: AppColors.background,
                  title: const Text("Goal Keeper"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: "Next",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          widget.onNext(_isGoalKeeper);
                        } else {
                          setState(() {
                            _autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      color: AppColors.highlight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
