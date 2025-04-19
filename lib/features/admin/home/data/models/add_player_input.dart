class AddPlayerInput {
  String? shortName;
  String? coachName;
  String? teamName;
  String? preferredFoot;
  String? clubPosition;
  int? weakFoot;
  double? weightKg;
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
}
