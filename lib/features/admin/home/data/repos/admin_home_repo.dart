import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';

abstract interface class AdminHomeRepo {
  ApiResult<List<Team>> getTeams();
  ApiResult<Unit> addMatch(MatchModel match);
  ApiResult<List<MatchModel>> getMatches();
}
