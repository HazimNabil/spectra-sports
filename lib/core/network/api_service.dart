import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.sendTimeout = const Duration(minutes: 2);
    _dio.options.receiveTimeout = const Duration(minutes: 2);
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
    Object data, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future patch(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.patch(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
