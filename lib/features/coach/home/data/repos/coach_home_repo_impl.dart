import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

class CoachHomeRepoImpl implements CoachHomeRepo {
  final ApiService _apiService;

  CoachHomeRepoImpl(this._apiService);

  @override
  ApiResult<Team> getTeam(String coachId) async {
    try {
      final token = await CacheHelper.getSecureData(ApiConstants.tokenKey);

      final jsonTeam = await _apiService.get(
        '${ApiConstants.baseUrl}${ApiConstants.getTeam}/$coachId',
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

      await _apiService.patch(
        '${ApiConstants.baseUrl}${ApiConstants.updateMatch}/${matchResultBody.matchId}',
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
        '${ApiConstants.baseUrl}${ApiConstants.getMatches}',
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

  @override
  ApiResult<String> predictPosition(PredictPositionInput input) async {
    try {
      final json = await _apiService.post(
        '${ApiConstants.aiBaseUrl}${ApiConstants.predict}',
        input.toJson(),
      );
      final position = json[ApiConstants.positionKey] as String;
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
      ApiConstants.imageKey: await MultipartFile.fromFile(image.path),
    });

    try {
      final json = await _apiService.post(
        '${ApiConstants.aiBaseUrl}${ApiConstants.predictFaces}',
        form,
        headers: {'Content-Type': 'multipart/form-data'},
      );
      final jsonAttendees = json[ApiConstants.predictionsKey] as List;
      final attendees = jsonAttendees.map((e) => Attendee.fromJson(e)).toList();
      return Right(attendees);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
