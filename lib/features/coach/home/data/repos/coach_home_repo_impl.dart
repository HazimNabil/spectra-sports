import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

class CoachHomeRepoImpl implements CoachHomeRepo {
  final ApiService _apiService;

  CoachHomeRepoImpl(this._apiService);

  @override
  ApiResult<Team> getTeam(String coachId) async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);

      final jsonTeam = await _apiService.get(
        '${ApiConstants.getTeam}?$coachId',
        {ApiConstants.authorization: '${ApiConstants.bearer} $token'},
      );
      final team = Team.fromJson(jsonTeam);

      return Right(team);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<Unit> addMatchResult(MatchResultBody matchResultBody) async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);

      await _apiService.post(
        ApiConstants.updateMatch,
        matchResultBody.toJson(),
        headers: {ApiConstants.authorization: '${ApiConstants.bearer} $token'},
      );

      return const Right(unit);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<List<MatchModel>> getMatches() async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);

      final jsonData = await _apiService.get(
        ApiConstants.getMatches,
        {ApiConstants.authorization: '${ApiConstants.bearer} $token'},
      );
      final jsonMatches = jsonData[ApiConstants.matchesKey] as List;
      final matches = jsonMatches.map((e) => MatchModel.fromJson(e)).toList();
      
      return Right(matches);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
