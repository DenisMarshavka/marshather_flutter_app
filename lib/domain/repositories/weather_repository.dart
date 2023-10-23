import 'package:dartz/dartz.dart';
import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/datasources/remote/remote.dart';
import 'package:marshather_app/domain/domain.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherForecastResponse>> getForecastDailyWithCity(
    WeatherForecastParams loginParams,
  );
}
