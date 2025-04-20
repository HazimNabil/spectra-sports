import 'package:equatable/equatable.dart';

import 'goalkeeping.dart';

class CoachPlayer extends Equatable {
  final String? id;
  final String? shortName;
  final String? teamName;
  final int? overall;
  final double height;
  final double weight;
  final String? clubPosition;
  final String? preferredFoot;
  final int weakFoot;
  final int pace;
  final int shooting;
  final int passing;
  final int dribbling;
  final int defending;
  final int physic;
  final Goalkeeping goalkeeping;
  final String? playerFaceUrl;
  final int? attackingCrossing;

  const CoachPlayer({
    required this.attackingCrossing,
    required this.id,
    required this.shortName,
    required this.teamName,
    required this.overall,
    required this.height,
    required this.weight,
    required this.clubPosition,
    required this.preferredFoot,
    required this.weakFoot,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physic,
    required this.goalkeeping,
    required this.playerFaceUrl,
  });

  factory CoachPlayer.fromJson(Map<String, dynamic> json) => CoachPlayer(
        id: json['id'] as String?,
        shortName: json['shortName'] as String?,
        teamName: json['teamName'] as String?,
        overall: json['overall'] as int?,
        height: (json['height'] as num).toDouble(),
        weight: (json['weight'] as num).toDouble(),
        clubPosition: json['clubPosition'] as String?,
        preferredFoot: json['preferredFoot'] as String?,
        weakFoot: json['weakFoot'] as int,
        pace: json['pace'] as int,
        shooting: json['shooting'] as int,
        passing: json['passing'] as int,
        dribbling: json['dribbling'] as int,
        defending: json['defending'] as int,
        physic: json['physic'] as int,
        goalkeeping:
            Goalkeeping.fromJson(json['goalkeeping'] as Map<String, dynamic>),
        playerFaceUrl: json['playerFaceUrl'] as String?,
        attackingCrossing: json['attackingCrossing'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'shortName': shortName,
        'teamName': teamName,
        'overall': overall,
        'height': height,
        'weight': weight,
        'clubPosition': clubPosition,
        'preferredFoot': preferredFoot,
        'weakFoot': weakFoot,
        'pace': pace,
        'shooting': shooting,
        'passing': passing,
        'dribbling': dribbling,
        'defending': defending,
        'physic': physic,
        'goalkeeping': goalkeeping.toJson(),
        'playerFaceUrl': playerFaceUrl,
        'attacking_crossing': attackingCrossing,
      };

  @override
  List<Object?> get props {
    return [
      id,
      shortName,
      teamName,
      overall,
      height,
      weight,
      clubPosition,
      preferredFoot,
      weakFoot,
      pace,
      shooting,
      passing,
      dribbling,
      defending,
      physic,
      goalkeeping,
      playerFaceUrl,
    ];
  }
}
