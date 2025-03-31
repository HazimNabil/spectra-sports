import 'package:dio/dio.dart';
import 'package:spectra_sports/core/errors/failure.dart';
import 'package:spectra_sports/core/network/api_constants.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout => ServerFailure(
          ApiConstants.connectionTimeoutMessage,
        ),
      DioExceptionType.receiveTimeout => ServerFailure(
          ApiConstants.receiveTimeoutMessage,
        ),
      DioExceptionType.badCertificate => ServerFailure(
          ApiConstants.badCertificateMessage,
        ),
      DioExceptionType.badResponse => ServerFailure.fromResponse(
          exception.response!,
        ),
      DioExceptionType.cancel => ServerFailure(
          ApiConstants.cancelledMessage,
        ),
      DioExceptionType.connectionError => ServerFailure(
          ApiConstants.connectionErrorMessage,
        ),
      DioExceptionType.unknown => ServerFailure(
          ApiConstants.unknownMessage,
        ),
      DioExceptionType.sendTimeout => ServerFailure(
          ApiConstants.sendTimeoutMessage,
        ),
    };
  }

  factory ServerFailure.fromResponse(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    return switch (statusCode) {
      400 || 401 || 403 => ServerFailure(data![ApiConstants.messageKey]),
      404 => ServerFailure(ApiConstants.notFoundMessage),
      500 => ServerFailure(ApiConstants.serverErrorMessage),
      _ => ServerFailure(ApiConstants.defaultErrorMessage)
    };
  }
}
