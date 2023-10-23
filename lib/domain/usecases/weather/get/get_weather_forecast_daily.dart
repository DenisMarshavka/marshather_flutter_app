import 'package:dartz/dartz.dart';
import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class GetWeatherForecastDaily
    extends UseCase<WeatherForecastResponse, WeatherForecastParams> {
  GetWeatherForecastDaily(this._repo);

  final WeatherRepository _repo;

  @override
  Future<Either<Failure, WeatherForecastResponse>> call(
          WeatherForecastParams params) =>
      _repo.getForecastDailyWithCity(params);
}

class WeatherForecastParams {
  WeatherForecastParams({
    this.cityName = '',
  });
  final String cityName;

  Map<String, dynamic> toJson() => {
        'cityName': cityName,
      };
}
