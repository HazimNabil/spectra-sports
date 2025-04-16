import 'coach_id.dart';
import 'player.dart';

class Team {
  final String id;
  final String name;
  final CoachId coachId;
  final List<Player> players;

  Team({
    required this.id,
    required this.name,
    required this.coachId,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['_id'] as String,
      name: json['name'] as String,
      coachId: CoachId.fromJson(json['coachId'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'coachId': coachId.toJson(),
      'players': players.map((e) => e.toJson()).toList(),
    };
  }
}
