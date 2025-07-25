import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/server_failure.dart';
import 'package:spectra_sports/core/network/api_constants.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/core/utils/cache_helper.dart';
import 'package:spectra_sports/core/utils/token_decoder.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/auth/data/models/change_password_body.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/user_model.dart';
import 'package:spectra_sports/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  ApiResult<UserModel> login(LoginBodyModel loginBody) async {
    try {
      final jsonData = await _apiService.post(
        "${ApiEndpoints.baseUrl}${ApiEndpoints.login}",
        loginBody.toJson(),
      );

      final jsonUser = TokenDecoder.decode(jsonData[ApiKeys.token]);
      final user = UserModel.fromJson(jsonUser);

      await CacheHelper.setSecureData(
        ApiKeys.token,
        jsonData[ApiKeys.token],
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  ApiResult<UserModel> signUp(SignUpBodyModel signUpBody) async {
    try {
      final jsonData = await _apiService.post(
        "${ApiEndpoints.baseUrl}${ApiEndpoints.register}",
        signUpBody.toJson(),
      );

      final jsonUser = TokenDecoder.decode(jsonData[ApiKeys.token]);
      final user = UserModel.fromJson(jsonUser);

      await CacheHelper.setSecureData(
        ApiKeys.token,
        jsonData[ApiKeys.token],
      );

      return Right(user);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<void> logout() async {
    await CacheHelper.deleteSecureData(ApiKeys.token);
  }

  @override
  Future<UserModel?> checkAuthStatus() async {
    final token = await CacheHelper.getSecureData(ApiKeys.token);

    if (token.isEmpty) return null;

    final jsonUser = TokenDecoder.decode(token);
    return UserModel.fromJson(jsonUser);
  }

  @override
  ApiResult<String> changePassword(
      ChangePasswordBody changePasswordBody) async {
    try {
      final token = await CacheHelper.getSecureData(ApiKeys.token);

      final jsonData = await _apiService.post(
        "${ApiEndpoints.baseUrl}${ApiEndpoints.changePassword}",
        changePasswordBody.toJson(),
        headers: {ApiKeys.authorization: '${ApiKeys.bearer} $token'},
      );

      final message = jsonData[ApiKeys.message] as String;

      return Right(message);
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
