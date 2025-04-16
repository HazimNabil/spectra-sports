import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String id;
  final String shortName;
  final String coachName;
  final String teamName;
  final String preferredFoot;
  final String clubPosition;
  final int weakFoot;
  final double weightKg;
  final int pace;
  final int shooting;
  final int passing;
  final int dribbling;
  final double heightCm;
  final int defending;
  final int overall;
  final int physic;
  final String playerFaceUrl;
  final int goalkeepingDiving;
  final int goalkeepingHandling;
  final int goalkeepingKicking;
  final int goalkeepingPositioning;
  final int goalkeepingReflexes;
  final int goalkeepingSpeed;

  const Player({
    required this.id,
    required this.shortName,
    required this.coachName,
    required this.teamName,
    required this.preferredFoot,
    required this.clubPosition,
    required this.weakFoot,
    required this.weightKg,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.heightCm,
    required this.defending,
    required this.overall,
    required this.physic,
    required this.playerFaceUrl,
    required this.goalkeepingDiving,
    required this.goalkeepingHandling,
    required this.goalkeepingKicking,
    required this.goalkeepingPositioning,
    required this.goalkeepingReflexes,
    required this.goalkeepingSpeed,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['_id'] as String,
      shortName: json['short_name'] as String,
      coachName: json['coachName'] as String,
      teamName: json['Team_name'] as String,
      preferredFoot: json['preferred_foot'] as String,
      clubPosition: json['club_position'] as String,
      weakFoot: json['weak_foot'] as int,
      weightKg: (json['weight_kg'] as num).toDouble(),
      pace: json['pace'] as int,
      shooting: json['shooting'] as int,
      passing: json['passing'] as int,
      dribbling: json['dribbling'] as int,
      heightCm: (json['height_cm'] as num).toDouble(),
      defending: json['defending'] as int,
      overall: json['overall'] as int,
      physic: json['physic'] as int,
      playerFaceUrl: json['player_face_url'] as String,
      goalkeepingDiving: json['goalkeeping_diving'] as int,
      goalkeepingHandling: json['goalkeeping_handling'] as int,
      goalkeepingKicking: json['goalkeeping_kicking'] as int,
      goalkeepingPositioning: json['goalkeeping_positioning'] as int,
      goalkeepingReflexes: json['goalkeeping_reflexes'] as int,
      goalkeepingSpeed: json['goalkeeping_speed'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'short_name': shortName,
      'coachName': coachName,
      'Team_name': teamName,
      'preferred_foot': preferredFoot,
      'club_position': clubPosition,
      'weak_foot': weakFoot,
      'weight_kg': weightKg,
      'pace': pace,
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
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      shortName,
      coachName,
      teamName,
      preferredFoot,
      clubPosition,
      weakFoot,
      weightKg,
      pace,
      shooting,
      passing,
      dribbling,
      heightCm,
      defending,
      overall,
      physic,
      playerFaceUrl,
      goalkeepingDiving,
      goalkeepingHandling,
      goalkeepingKicking,
      goalkeepingPositioning,
      goalkeepingReflexes,
      goalkeepingSpeed,
    ];
  }
}
