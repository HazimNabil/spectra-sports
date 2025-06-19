import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/parent_player_data.dart';
import 'package:spectra_sports/features/parent/home/data/repos/parent_home_repo.dart';

class ParentHomeRepoImpl implements ParentHomeRepo {
  final ApiService _apiService;

  ParentHomeRepoImpl(this._apiService);

  @override
  ApiResult<List<ParentPlayerData>> getPlayersData() async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.getParentPlayers}',
        {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );

      final jsonList = jsonData[ApiKeys.players] as List;
      final playersData =
          jsonList.map((player) => ParentPlayerData.fromJson(player)).toList();

      return Right(playersData);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<Unit> payFees(double amount) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      await _apiService.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.payment}',
        {'amount': amount},
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
