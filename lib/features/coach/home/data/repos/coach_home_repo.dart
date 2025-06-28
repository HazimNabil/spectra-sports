import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team_response/coach_team_response.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/shot_analysis.dart';

abstract interface class CoachHomeRepo {
  ApiResult<CoachTeamResponse> getTeam();
  ApiResult<List<MatchModel>> getMatches();
  ApiResult<Unit> addMatchResult(MatchResultBody matchResultBody);
  ApiResult<String> predictPosition(PredictPositionInput input);
  ApiResult<String> updatePosition(String playerId, String position);
  ApiResult<List<Attendee>> takeAttendance(File image, String teamName);
  ApiResult<ShotAnalysis> analyzeShots(File video);
}
