import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';

class AddPlayer2 extends StatelessWidget {
   final void Function() onNext;
   const AddPlayer2({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CustomButton(title: "Next", onPressed: () => onNext(), color: AppColors.buttons)
        ],
       );
       
    
  }
}