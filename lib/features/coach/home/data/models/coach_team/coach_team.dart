import 'package:equatable/equatable.dart';

import 'coach_player.dart';

class CoachTeam extends Equatable {
  final String? id;
  final String? name;
  final List<CoachPlayer> players;

  const CoachTeam({this.id, this.name, required this.players});

  factory CoachTeam.fromJson(Map<String, dynamic> json) => CoachTeam(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        players: json['players'] == null
            ? []
            : (json['players'] as List<dynamic>)
                .map((e) => CoachPlayer.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'players': players.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, players];
}
