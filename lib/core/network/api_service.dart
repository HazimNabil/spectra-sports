import 'package:dio/dio.dart';
import 'package:spectra_sports/core/network/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
  }

  Future post(String endpoint, Map<String, dynamic> data) async {
    final response = await _dio.post(endpoint, data: data);
    return response.data;
  }
}
