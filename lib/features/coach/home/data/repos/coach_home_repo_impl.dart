import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team_response/coach_team_response.dart';
import 'package:spectra_sports/features/coach/home/data/models/face_model_response/face_model_response.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

class CoachHomeRepoImpl implements CoachHomeRepo {
  final ApiService _apiService;

  CoachHomeRepoImpl(this._apiService);

  @override
  ApiResult<CoachTeamResponse> getTeam() async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final jsonData = await _apiService.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.getCoachTeam}',
        {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );
      final jsonMap = jsonData as Map<String, dynamic>;
      final team = CoachTeamResponse.fromJson(jsonMap);

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
  ApiResult<List<Attendee>> takeAttendance(File image, String teamName) async {
    final form = FormData.fromMap({
      ApiKeys.image: await MultipartFile.fromFile(image.path),
      ApiKeys.team: teamName,
    });

    final token = await CacheHelper.getSecureData(ApiKeys.token);

    try {
      final predictions = await runFaceModel(form);
      await markAttendance(predictions, token, teamName);
      final attendees = await getAttendance(token, teamName);
      return Right(attendees);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<List<Attendee>> getAttendance(String token, String teamName) async {
    final date =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
    final jsonResponse = await _apiService.get(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.getAttendance}?date=$date&teamId=$teamName',
      {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
    );
    final jsonAttendees = jsonResponse as List;
    final attendees = jsonAttendees.map((e) => Attendee.fromJson(e)).toList();
    return attendees;
  }

  Future<void> markAttendance(
      List<FaceModelResponse> predictions, String token, String teamName) async {
    final names = predictions.map((prediction) => prediction.name).toList();
    log(names.toString());
    await _apiService.post(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.markAttendance}?teamId=$teamName',
      {"playerIds": names, "source": "face_recognition"},
      headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
    );
  }

  Future<List<FaceModelResponse>> runFaceModel(FormData form) async {
    final json = await _apiService.post(
      '${ApiEndpoints.aiBaseUrl}${ApiEndpoints.predictFaces}',
      form,
      headers: {'Content-Type': 'multipart/form-data'},
    );
    final jsonPredictions = json[ApiKeys.predictions] as List;
    final predictions =
        jsonPredictions.map((e) => FaceModelResponse.fromJson(e)).toList();
    return predictions;
  }

  @override
  ApiResult<String> updatePosition(String playerId, String position) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final json = await _apiService.patch(
        '${ApiEndpoints.baseUrl}/players/$playerId/position',
        {'club_position': position},
        headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );

      final newPosition = json['player']['club_position'] as String;

      return Right(newPosition);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
