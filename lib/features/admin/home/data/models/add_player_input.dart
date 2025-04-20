class AddPlayerInput {
  String? shortName;
  String coachName;
  String teamName;
  String? preferredFoot;
  String? clubPosition;
  int? weakFoot;
  double? weightKg;
  int? attackingCrossing;
  int? pace;
  int? shooting;
  int? passing;
  int? dribbling;
  double? heightCm;
  int? defending;
  int? overall;
  int? physic;
  String playerFaceUrl = 'default_image';
  int? goalkeepingDiving;
  int? goalkeepingHandling;
  int? goalkeepingKicking;
  int? goalkeepingPositioning;
  int? goalkeepingReflexes;
  int? goalkeepingSpeed;

  AddPlayerInput({required this.coachName, required this.teamName});

  Map<String, dynamic> toJson() {
    return {
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
      'attacking_crossing': attackingCrossing,
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
}
