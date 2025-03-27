import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: AppColors.icons,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        iconSize: 20,
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.highlight,
        ),
        onPressed: () => context.pop(),
      ),
    );
  }
}
