class MatchResultBody {
  String? matchId;
  int? team1Score;
  int? team2Score;

  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'team1Score': team1Score,
      'team2Score': team2Score,
    };
  }
}
