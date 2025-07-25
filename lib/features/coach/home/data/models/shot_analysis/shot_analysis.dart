import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/analysis_result.dart';

class ShotAnalysis {
  final double goalProbability;
  final List<AnalysisResult> results;
  final int totalGoals;
  final int totalShots;

  ShotAnalysis({
    required this.goalProbability,
    required this.results,
    required this.totalGoals,
    required this.totalShots,
  });

  factory ShotAnalysis.fromJson(Map<String, dynamic> json) {
    return ShotAnalysis(
      goalProbability: json['goal_probability'] as double,
      results: (json['results'] as List<dynamic>)
          .map((e) => AnalysisResult.fromJson(e))
          .toList(),
      totalGoals: json['total_goals'] as int,
      totalShots: json['total_shots'] as int,
    );
  }
}
