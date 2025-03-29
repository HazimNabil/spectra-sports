import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class MatchResult extends StatelessWidget {
  const MatchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1',
          style: AppStyles.styleExtraBold24(context),
        ),
        Text(
          '0',
          style: AppStyles.styleExtraBold24(context),
        ),
      ],
    );
  }
}
