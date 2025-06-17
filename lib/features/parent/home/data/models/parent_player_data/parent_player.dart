import 'attendance.dart';

class ParentPlayer {
  String? id;
  String? shortName;
  String? teamName;
  String? preferredFoot;
  String? clubPosition;
  int? weakFoot;
  int? weightKg;
  int? pace;
  int? attackingCrossing;
  int? shooting;
  int? passing;
  int? dribbling;
  int? heightCm;
  int? defending;
  dynamic overall;
  int? physic;
  String? playerFaceUrl;
  num? goalkeepingDiving;
  num? goalkeepingHandling;
  num? goalkeepingKicking;
  num? goalkeepingPositioning;
  num? goalkeepingReflexes;
  num? goalkeepingSpeed;
  List<Attendance>? attendance;

  ParentPlayer({
    this.id,
    this.shortName,
    this.teamName,
    this.preferredFoot,
    this.clubPosition,
    this.weakFoot,
    this.weightKg,
    this.pace,
    this.attackingCrossing,
    this.shooting,
    this.passing,
    this.dribbling,
    this.heightCm,
    this.defending,
    this.overall,
    this.physic,
    this.playerFaceUrl,
    this.goalkeepingDiving,
    this.goalkeepingHandling,
    this.goalkeepingKicking,
    this.goalkeepingPositioning,
    this.goalkeepingReflexes,
    this.goalkeepingSpeed,
    this.attendance,
  });

  factory ParentPlayer.fromJson(Map<String, dynamic> json) {
    return ParentPlayer(
      id: json['_id'] as String?,
      shortName: json['short_name'] as String?,
      teamName: json['Team_name'] as String?,
      preferredFoot: json['preferred_foot'] as String?,
      clubPosition: json['club_position'] as String?,
      weakFoot: json['weak_foot'] as int?,
      weightKg: json['weight_kg'] as int?,
      pace: json['pace'] as int?,
      attackingCrossing: json['attacking_crossing'] as int?,
      shooting: json['shooting'] as int?,
      passing: json['passing'] as int?,
      dribbling: json['dribbling'] as int?,
      heightCm: json['height_cm'] as int?,
      defending: json['defending'] as int?,
      overall: json['overall'] as dynamic,
      physic: json['physic'] as int?,
      playerFaceUrl: json['player_face_url'] as String?,
      goalkeepingDiving: json['goalkeeping_diving'] as num?,
      goalkeepingHandling: json['goalkeeping_handling'] as num?,
      goalkeepingKicking: json['goalkeeping_kicking'] as num?,
      goalkeepingPositioning: json['goalkeeping_positioning'] as num?,
      goalkeepingReflexes: json['goalkeeping_reflexes'] as num?,
      goalkeepingSpeed: json['goalkeeping_speed'] as num?,
      attendance: (json['attendance'] as List<dynamic>?)
          ?.map((e) => Attendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'short_name': shortName,
      'Team_name': teamName,
      'preferred_foot': preferredFoot,
      'club_position': clubPosition,
      'weak_foot': weakFoot,
      'weight_kg': weightKg,
      'pace': pace,
      'attacking_crossing': attackingCrossing,
      'shooting': shooting,
      'passing': passing,
      'dribbling': dribbling,
      'height_cm': heightCm,
      'defending': defending,
      'overall': overall,
      'physic': physic,
      'player_face_url': playerFaceUrl,
      'goalkeeping_diving': goalkeepingDiving,
      'goalkeeping_handling': goalkeepingHandling,
      'goalkeeping_kicking': goalkeepingKicking,
      'goalkeeping_positioning': goalkeepingPositioning,
      'goalkeeping_reflexes': goalkeepingReflexes,
      'goalkeeping_speed': goalkeepingSpeed,
      'attendance': attendance?.map((e) => e.toJson()).toList(),
    };
  }
}
