import 'package:dartz/dartz.dart';
import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class GetWeatherForecastDaily
    extends UseCase<WeatherForecastDaysHourlyResponse, WeatherForecastParams> {
  GetWeatherForecastDaily(this._repo);

  final WeatherRepository _repo;

  @override
  Future<Either<Failure, WeatherForecastDaysHourlyResponse>> call(
          WeatherForecastParams params) =>
      _repo.getForecastDaysHourly(params);
}

class WeatherForecastParams {
  WeatherForecastParams({
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
