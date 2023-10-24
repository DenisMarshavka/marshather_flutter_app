import 'package:dio/dio.dart';
import 'package:marshather_app/data/datasources/remote/services/dio_interceptor.dart';
import 'package:marshather_app/utils/utils.dart';

class DioGeocodingClient {
  DioGeocodingClient({
    bool isUnitTest = false,
  }) {
    _isUnitTest = isUnitTest;

    try {
      //_authToken = sl<PrefManager>().token;
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest) {
      _dio.interceptors.add(DioInterceptor());
    }
  }

  late Dio _dio;
  String? _authToken;
  bool _isUnitTest = false;

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      final dio = _createDio();

      if (!_isUnitTest) {
        dio.interceptors.add(DioInterceptor());
      }

      return dio;
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: '${Constants.baseScheme}${Constants.geocodingBaseUrlDomain}',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Keep-Alive': 'timeout=5, max=1000',
            // Authorization
            if (_authToken != null && _authToken!.isNotEmpty)
              'Authorization': 'Token $_authToken',
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
