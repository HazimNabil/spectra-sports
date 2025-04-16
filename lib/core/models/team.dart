import 'package:spectra_sports/core/models/coach_id.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/player.dart';

class Team {
  final String id;
  final String name;
  final CoachId? coachId;
  final List<Player> players;
  final List<MatchModel> matches;

  Team({
    required this.id,
    required this.name,
    required this.coachId,
    required this.players,
    required this.matches,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['_id'] as String,
      name: json['name'] as String,
      coachId: json['coachId'] == null
          ? null
          : CoachId.fromJson(json['coachId'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      matches: (json['matchSchedule'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'coachId': coachId?.toJson(),
      'players': players.map((e) => e.toJson()).toList(),
      'matchSchedule': matches.map((e) => e.toJson()).toList(),
    };
  }
}
