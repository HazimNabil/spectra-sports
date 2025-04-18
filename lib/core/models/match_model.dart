import 'package:equatable/equatable.dart';
// import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';

class MatchModel extends Equatable {
  final String id;
  final String team1;
  final String team2;
  final DateTime date;
  final int? team1Score;
  final int? team2Score;
  final String? status;

  const MatchModel({
    required this.id,
    required this.team1,
    required this.team2,
    required this.date,
    this.team1Score,
    this.team2Score,
    this.status,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['_id'] as String,
      team1: json['team1'] as String,
      team2: json['team2'] as String,
      date: DateTime.parse(json['date'] as String),
      team1Score: json['team1Score'] as int?,
      team2Score: json['team2Score'] as int?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'team1': team1,
      'team2': team2,
      'date': date.toIso8601String(),
      'team1Score': team1Score,
      'team2Score': team2Score,
      'status': status,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      team1,
      team2,
      date,
      team1Score,
      team2Score,
      status,
    ];
  }
}
