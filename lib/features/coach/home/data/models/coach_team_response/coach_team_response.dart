import 'coach.dart';
import 'coach_team.dart';

class CoachTeamResponse {
  Coach? coach;
  CoachTeam? team;

  CoachTeamResponse({this.coach, this.team});

  factory CoachTeamResponse.fromJson(Map<String, dynamic> json) {
    return CoachTeamResponse(
      coach: json['coach'] == null
          ? null
          : Coach.fromJson(json['coach'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : CoachTeam.fromJson(json['team'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coach': coach?.toJson(),
      'team': team?.toJson(),
    };
  }
}
