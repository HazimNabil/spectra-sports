class AddMatchInput {
  String? matchName;
  String? opponentTeam;
  DateTime? date;

  Map<String, dynamic> toJson() {
    return {
      'matchName': matchName,
      'opponentTeam': opponentTeam,
      'date': date!.toIso8601String(),
    };
  }
}
