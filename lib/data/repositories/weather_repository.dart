import 'dart:async';
import 'package:dartz/dartz.dart';

import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this.weatherRemoteDatasource);
  final WeatherRemoteDatasource weatherRemoteDatasource;

  @override
  Future<Either<Failure, WeatherForecastResponse>> getForecastDailyWithCity(
    WeatherForecastParams params,
  ) async {
    try {
      final response =
          await weatherRemoteDatasource.getForecastDailyWithCity(params);

      return Right(
        WeatherForecastResponse(
          city: response.city,
          cod: response.cod,
          message: response.message,
          cnt: response.cnt,
          list: response.list,
        ),
      );
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
