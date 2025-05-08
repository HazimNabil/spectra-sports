import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/failure.dart';
import 'package:spectra_sports/core/network/api_constants.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout => ServerFailure(
          ApiErrors.connectionTimeout,
        ),
      DioExceptionType.receiveTimeout => ServerFailure(
          ApiErrors.receiveTimeout,
        ),
      DioExceptionType.badCertificate => ServerFailure(
          ApiErrors.badCertificate,
        ),
      DioExceptionType.badResponse => ServerFailure.fromResponse(
          exception.response!,
        ),
      DioExceptionType.cancel => ServerFailure(
          ApiErrors.cancelled,
        ),
      DioExceptionType.connectionError => ServerFailure(
          ApiErrors.connectionError,
        ),
      DioExceptionType.unknown => ServerFailure(
          ApiErrors.unknown,
        ),
      DioExceptionType.sendTimeout => ServerFailure(
          ApiErrors.sendTimeout,
        ),
    };
  }

  factory ServerFailure.fromResponse(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    return switch (statusCode) {
      400 || 401 || 403 => ServerFailure(data![ApiKeys.message]),
      404 => ServerFailure(ApiErrors.notFound),
      500 => ServerFailure(ApiErrors.serverError),
      _ => ServerFailure(ApiErrors.defaultError)
    };
  }
}
