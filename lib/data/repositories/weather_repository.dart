import 'dart:async';
import 'package:dartz/dartz.dart';

import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this.weatherRemoteDatasource);
  final WeatherRemoteDatasource weatherRemoteDatasource;

  @override
  Future<Either<Failure, WeatherForecastDaysHourlyResponse>>
      getForecastDaysHourly(
    WeatherForecastParams params,
  ) async {
    try {
      final response =
          await weatherRemoteDatasource.getForecastDaysHourly(params);

      return Right(
        WeatherForecastDaysHourlyResponse(
          latitude: response.latitude,
          longitude: response.longitude,
          generationtimeMs: response.generationtimeMs,
          utcOffsetSeconds: response.utcOffsetSeconds,
          timezone: response.timezone,
          timezoneAbbreviation: response.timezoneAbbreviation,
          elevation: response.elevation,
          hourlyUnits: response.hourlyUnits,
          hourly: response.hourly,
        ),
      );
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
