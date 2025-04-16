import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';

class Addplayer1 extends StatelessWidget {
   final void Function(bool) onNext;
   const Addplayer1({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Center(child: CustomButton(title: "Next", onPressed: () => onNext(false), color: AppColors.highlight))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
       );
       
    
  }
}