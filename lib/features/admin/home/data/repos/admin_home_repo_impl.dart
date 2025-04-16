import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

class AdminHomeRepoImpl implements AdminHomeRepo {
  final ApiService _apiService;

  AdminHomeRepoImpl(this._apiService);

  @override
  ApiResult<List<Team>> getTeams() async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);
      final jsonData = await _apiService.get(
        ApiConstants.getTeams,
        {ApiConstants.authorization: '${ApiConstants.bearer} $token'},
      );
      final jsonList = jsonData[ApiConstants.teamsKey] as List;
      final teams = jsonList.map((team) => Team.fromJson(team)).toList();
      return Right(teams);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<Unit> addMatch(MatchModel match) async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);
      await _apiService.post(
        ApiConstants.addMatch,
        match.toJson(),
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
  ApiResult<List<MatchModel>> getMatches() {
    // TODO: implement getMatches
    throw UnimplementedError();
  }
}
