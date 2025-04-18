import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_styles.dart';

class MatchResult extends StatelessWidget {
  final int? team1Score;
  final int? team2Score;

  const MatchResult({
    super.key,
    required this.team1Score,
    required this.team2Score,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            team1Score?.toString() ?? '',
            style: AppStyles.styleExtraBold24(context),
          ),
          Text(
            team2Score?.toString() ?? '',
            style: AppStyles.styleExtraBold24(context),
          ),
        ],
      ),
    );
  }
}
