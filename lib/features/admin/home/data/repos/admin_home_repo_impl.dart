import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

class AdminHomeRepoImpl implements AdminHomeRepo {
  final ApiService _apiService;

  AdminHomeRepoImpl(this._apiService);

  @override
  ApiResult<List<Team>> getTeams() async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);
      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.getTeams}',
        {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );
      final jsonList = jsonData[ApiKeys.teams] as List;
      final teams = jsonList.map((team) => Team.fromJson(team)).toList();
      return Right(teams);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<Unit> addMatch(AddMatchInput input) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);
      await _apiService.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.addMatch}',
        input.toJson(),
        headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<List<MatchModel>> getMatches(String teamId) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);
      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.adminGetMatches}/$teamId/matches',
        {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );
      final jsonMatches = jsonData[ApiKeys.matches] as List;
      final matches = jsonMatches.map((e) => MatchModel.fromJson(e)).toList();

      return Right(matches);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<Unit> addPlayer(AddPlayerInput input) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      await _apiService.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.addPlayer}/${input.teamName}/players',
        input.toJson(),
        headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );

      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
