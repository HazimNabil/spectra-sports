import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section0.dart';

class Addplayer1 extends StatefulWidget {
  final void Function(bool) onNext;

  const Addplayer1({required this.onNext, Key? key}) : super(key: key);

  @override
  State<Addplayer1> createState() => _Addplayer1State();
}

class _Addplayer1State extends State<Addplayer1> {
  bool _isGoalKeeper = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        children: [
          Form(
              child: Column(
            children: [
              PlayerSpecsSection0(),
              CheckboxListTile(
                value: _isGoalKeeper,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isGoalKeeper = newValue!;
                  });
                },
                activeColor: AppColors.highlight,
                checkColor: AppColors.background,
                tileColor: Colors.black12,
                title: const Text("GoalKeeper"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Center(
                  child: CustomButton(
                      title: "Next",
                      onPressed: () => widget.onNext(_isGoalKeeper),
                      color: AppColors.highlight)),
            ],
          )),
        ],
      ),
    );
  }
}
