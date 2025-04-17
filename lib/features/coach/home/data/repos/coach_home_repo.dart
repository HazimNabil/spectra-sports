import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';

abstract interface class CoachHomeRepo {
  ApiResult<Team> getTeam(String coachId);
  ApiResult<Unit> addMatchResult(MatchResultBody matchResultBody);
}
