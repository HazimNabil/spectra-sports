import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team/coach_player.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team/coach_team.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

class CoachHomeRepoImpl implements CoachHomeRepo {
  final ApiService _apiService;

  CoachHomeRepoImpl(this._apiService);

  @override
  ApiResult<CoachTeam> getTeam() async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.getCoachTeam}',
        {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );
      final jsonTeam = jsonData[ApiKeys.team] as Map<String, dynamic>;
      final team = CoachTeam.fromJson(jsonTeam);

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
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      await _apiService.patch(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.updateMatch}/${matchResultBody.matchId}',
        matchResultBody.toJson(),
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
  ApiResult<List<MatchModel>> getMatches() async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.coachGetMatches}',
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
  ApiResult<String> predictPosition(PredictPositionInput input) async {
    try {
      final json = await _apiService.post(
        '${ApiEndpoints.aiBaseUrl}${ApiEndpoints.predict}',
        input.toJson(),
      );
      var position = json[ApiKeys.position] as String;
      if (position == 'W') {
        if (input.preferredFoot == 'left') position = 'RW';
        if (input.preferredFoot == 'right') position = 'LW';
      } else if (position == 'B') {
        if (input.preferredFoot == 'left') position = 'RB';
        if (input.preferredFoot == 'right') position = 'LB';
      }
      return Right(position);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<List<Attendee>> takeAttendance(File image) async {
    final form = FormData.fromMap({
      ApiKeys.image: await MultipartFile.fromFile(image.path),
    });

    try {
      final json = await _apiService.post(
        '${ApiEndpoints.aiBaseUrl}${ApiEndpoints.predictFaces}',
        form,
        headers: {'Content-Type': 'multipart/form-data'},
      );
      final jsonAttendees = json[ApiKeys.predictions] as List;
      final attendees = jsonAttendees.map((e) => Attendee.fromJson(e)).toList();
      return Right(attendees);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  ApiResult<CoachPlayer> updatePosition(String playerId, String position) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final json = await _apiService.patch(
        '${ApiEndpoints.baseUrl}/players/$playerId/position',
        {'club_position': position},
        headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );

      return Right(CoachPlayer.fromJson(json));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
