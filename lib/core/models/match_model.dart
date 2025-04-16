class MatchModel {
  final String name;
  final String team1;
  final String team2;
  final DateTime date;
  final int team1Score;
  final int team2Score;
  final String status;

  MatchModel({
    required this.name,
    required this.team1,
    required this.team2,
    required this.date,
    required this.team1Score,
    required this.team2Score,
    required this.status,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      name: json['_id'] as String,
      team1: json['team1'] as String,
      team2: json['team2'] as String,
      date: DateTime.parse(json['date'] as String),
      team1Score: json['team1Score'] as int,
      team2Score: json['team2Score'] as int,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': name,
      'team1': team1,
      'team2': team2,
      'date': date.toIso8601String(),
      'team1Score': team1Score,
      'team2Score': team2Score,
      'status': status,
    };
  }
}
