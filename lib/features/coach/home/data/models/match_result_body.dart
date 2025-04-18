class MatchResultBody {
  String matchId;
  int? team1Score;
  int? team2Score;
  String status = 'finished';
  DateTime date;

  MatchResultBody({
    required this.matchId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'team1Score': team1Score,
      'team2Score': team2Score,
      'status': status,
      'date': date.toIso8601String(),
    };
  }
}
