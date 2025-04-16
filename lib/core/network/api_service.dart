import 'package:dio/dio.dart';
import 'package:spectra_sports/core/network/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
  }

  Future get(String endpoint, Map<String, dynamic> headers) async {
    final response = await _dio.get(
      endpoint,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future post(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
