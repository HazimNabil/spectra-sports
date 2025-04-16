class Player {
  final String id;
  final String shortName;
  final String clubPosition;
  final int overall;

  Player({
    required this.id,
    required this.shortName,
    required this.clubPosition,
    required this.overall,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['_id'] as String,
      shortName: json['short_name'] as String,
      clubPosition: json['club_position'] as String,
      overall: json['overall'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'short_name': shortName,
      'club_position': clubPosition,
      'overall': overall,
    };
  }
}
