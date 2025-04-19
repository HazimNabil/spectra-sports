import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';

abstract interface class AdminHomeRepo {
  ApiResult<List<Team>> getTeams();
  ApiResult<Unit> addMatch(AddMatchInput match);
  ApiResult<List<MatchModel>> getMatches();
  ApiResult<Unit> addPlayer(AddPlayerInput input);
}
