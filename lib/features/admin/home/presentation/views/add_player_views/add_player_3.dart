import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';

class AddPlayer3 extends StatelessWidget {
   final void Function() onNext;
   const AddPlayer3({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(title: "Next", onPressed: () => onNext(), color: AppColors.text)
          ],
         ),
    );
       
    
  }
}