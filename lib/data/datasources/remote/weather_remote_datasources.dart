import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/datasources/remote/remote.dart';
import 'package:marshather_app/domain/usecases/usecases.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherForecastDaysHourlyResponse> getForecastDaysHourly(
      WeatherForecastParams params);
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  WeatherRemoteDatasourceImpl(
    this._client,
    this._noTokenClient,
  );

  final DioClient _client;
  final NoTokenDioClient _noTokenClient;

  @override
  Future<WeatherForecastDaysHourlyResponse> getForecastDaysHourly(
    WeatherForecastParams registerParams,
  ) async {
    try {
      final response = await _noTokenClient.getRequest(
        ListApi.weatherForecastHourly(registerParams),
      );
      final dynamic data = response.data;
      final json = Map<String, dynamic>.from(data as Map);

      final result = WeatherForecastDaysHourlyResponse.fromJson(json);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      } else {
        throw const ServerException(arrayMessage: ['status code != 200']);
      }
    } on ServerException {
      rethrow;
    }
  }
}
