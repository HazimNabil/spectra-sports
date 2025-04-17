import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';

class Addplayer1 extends StatelessWidget {
   final void Function(bool) onNext;
   const Addplayer1({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Form(child: Column(
            children: [
              Title(color: AppColors.highlight, child: Text("Hello")),
              CustomTextField(hintText: 'hintText')

            ],
          ))
          ,
          Center(child: CustomButton(title: "Next", onPressed: () => onNext(true), color: AppColors.highlight))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
       );
       
    
  }
}