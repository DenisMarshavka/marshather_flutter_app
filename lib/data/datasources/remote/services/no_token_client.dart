import 'package:dio/dio.dart';
import 'package:marshather_app/data/datasources/remote/services/dio_interceptor.dart';
import 'package:marshather_app/utils/utils.dart';

class NoTokenDioClient {
  NoTokenDioClient();

  Dio get dio {
    final dio = _createDio();

    dio.interceptors.add(DioInterceptor());

    return dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: '${Constants.baseScheme}${Constants.weatherBaseUrlDomain}',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Keep-Alive': 'timeout=5, max=1000'
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Response> getRequest(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> postRequest(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio.post(url, data: data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> putRequest(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio.put(url, data: data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
