import 'goalkeeping.dart';

class CoachPlayer {
  final String id;
  final String shortName;
  final String teamName;
  int? overall;
  double? height;
  double? weight;
  String? clubPosition;
  String? clubName;
  int? attackingCrossing;
  String? preferredFoot;
  int? weakFoot;
  int? pace;
  int? shooting;
  int? passing;
  int? dribbling;
  int? defending;
  int? physic;
  Goalkeeping? goalkeeping;
  String? playerFaceUrl;

  CoachPlayer({
    required this.id,
    required this.shortName,
    required this.teamName,
    required this.overall,
    this.height,
    this.weight,
    this.clubPosition,
    this.clubName,
    this.attackingCrossing,
    this.preferredFoot,
    this.weakFoot,
    this.pace,
    this.shooting,
    this.passing,
    this.dribbling,
    this.defending,
    this.physic,
    this.goalkeeping,
    this.playerFaceUrl,
  });

  factory CoachPlayer.fromJson(Map<String, dynamic> json) {
    return CoachPlayer(
      id: json['id'] as String,
      shortName: json['shortName'] as String,
      teamName: json['teamName'] as String,
      overall: json['overall'] as int,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      clubPosition: json['clubPosition'] as String?,
      clubName: json['clubName'] as String?,
      attackingCrossing: json['attackingCrossing'] as int?,
      preferredFoot: json['preferredFoot'] as String?,
      weakFoot: json['weakFoot'] as int?,
      pace: json['pace'] as int?,
      shooting: json['shooting'] as int?,
      passing: json['passing'] as int?,
      dribbling: json['dribbling'] as int?,
      defending: json['defending'] as int?,
      physic: json['physic'] as int?,
      goalkeeping: json['goalkeeping'] == null
          ? null
          : Goalkeeping.fromJson(json['goalkeeping'] as Map<String, dynamic>),
      playerFaceUrl: json['playerFaceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shortName': shortName,
      'teamName': teamName,
      'overall': overall,
      'height': height,
      'weight': weight,
      'clubPosition': clubPosition,
      'clubName': clubName,
      'attackingCrossing': attackingCrossing,
      'preferredFoot': preferredFoot,
      'weakFoot': weakFoot,
      'pace': pace,
      'shooting': shooting,
      'passing': passing,
      'dribbling': dribbling,
      'defending': defending,
      'physic': physic,
      'goalkeeping': goalkeeping?.toJson(),
      'playerFaceUrl': playerFaceUrl,
    };
  }
}
