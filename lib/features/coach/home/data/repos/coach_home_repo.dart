import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team/coach_team.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';

abstract interface class CoachHomeRepo {
  ApiResult<CoachTeam> getTeam();
  ApiResult<List<MatchModel>> getMatches();
  ApiResult<Unit> addMatchResult(MatchResultBody matchResultBody);
  ApiResult<String> predictPosition(PredictPositionInput input);
  ApiResult<String> updatePosition(String playerId, String position);
  ApiResult<List<Attendee>> takeAttendance(File image);
}
