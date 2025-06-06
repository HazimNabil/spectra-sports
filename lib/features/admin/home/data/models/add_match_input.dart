class AddMatchInput {
  String? matchName;
  String? team1;
  String? team2;
  DateTime? date;

  Map<String, dynamic> toJson() {
    return {
      '_id': matchName,
      'team1': team1,
      'team2': team2,
      'date': date!.toIso8601String(),
    };
  }
}
