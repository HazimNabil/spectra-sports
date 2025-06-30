import 'player.dart';

class CoachTeam {
  final String id;
  final String name;
  final List<CoachPlayer> players;

  CoachTeam({required this.id, required this.name, required this.players});

  factory CoachTeam.fromJson(Map<String, dynamic> json) {
    return CoachTeam(
      id: json['_id'] as String,
      name: json['name'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => CoachPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'players': players.map((e) => e.toJson()).toList(),
    };
  }
}
