import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/core/widgets/custom_text_field.dart';
import 'package:spectra_sports/features/admin/home/presentation/widgets/player_specs_section0.dart';

class Addplayer1 extends StatelessWidget {
   final void Function(bool) onNext;
   const Addplayer1({required this.onNext, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(child: Column(
            children: [
            PlayerSpecsSection0(),
             Center(child: CustomButton(title: "Next", onPressed: () => onNext(false), color: AppColors.highlight))
             
            ],
          ))
          
         
        ],
       );
       
    
  }
}