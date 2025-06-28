import 'package:equatable/equatable.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/player.dart';

class Team extends Equatable {
  final String id;
  final String name;
  final List<Player> players;
  final List<MatchModel> matches;
  final String coachName;

  const Team({
    required this.id,
    required this.name,
    required this.players,
    required this.matches,
    required this.coachName,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['_id'] as String,
      name: json['name'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      matches: (json['matchSchedule'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      coachName: (json['coachId'] as Map<String, dynamic>?)?['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'players': players.map((e) => e.toJson()).toList(),
      'matchSchedule': matches.map((e) => e.toJson()).toList(),
      'coachId': {'_id': coachName, 'name': coachName},
    };
  }

  @override
  List<Object?> get props => [id, name, players, matches, coachName];
}
