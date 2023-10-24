import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marshather_app/data/datasources/remote/remote.dart';
import 'package:marshather_app/utils/utils.dart';
import 'package:marshather_app/core/error/error.dart';
import 'package:marshather_app/domain/entities/entities.dart';
import 'package:marshather_app/domain/usecases/usecases.dart';

part 'home_day_hours_state.dart';

class HomeDayHoursCubit extends Cubit<HomeDayHoursState> {
  HomeDayHoursCubit({
    required GetWeatherForecastDaily getWeatherDayHourly,
  })  : _getWeatherDayHourly = getWeatherDayHourly,
        super(
          const HomeDayHoursState(
            selectedWeather: null,
            weatherHours: [],
            isLoading: true,
          ),
        );

  final GetWeatherForecastDaily _getWeatherDayHourly;

  Future<void> getWeatherDay({required WeatherForecastParams params}) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          weatherHours: [],
        ),
      );

      final result = await _getWeatherDayHourly.call(params);

      result.fold((l) {
        emit(
          state.copyWith(
            isLoading: false,
            weatherHours: [],
          ),
        );

        log('two_factor_auth_cubit@@@getWeatherDay Error: $l');
      }, (r) {
        late List<WeatherInfo> weatherHoursData = [];

        if (r.hourly?.time != null) {
          for (var i = 0; i < r.hourly!.time!.length; i++) {
            if (i < Constants.dayHours) {
              final int weatherCode = r.hourly?.weatherCode?[i] ?? -1;
              final String weatherTime =
                  r.hourly?.time?[i] ?? DateTime.now.toString();
              final int currentHour = DateTime.now().hour;
              final int itemDataHour = DateTime.parse(weatherTime).hour;

              final WeatherInfo itemData = WeatherInfo(
                temperature: r.hourly?.temperature2m?[i].round(),
                time: r.hourly?.time?[i],
                windSpeed: r.hourly?.windSpeed10m?[i].round(),
                weatherCode: weatherCode,
                humidity: r.hourly?.relativeHumidity2m?[i],
                rain: r.hourly?.chanceOfRain?[i],
                rainMetric: r.hourlyUnits?.chanceOfRainMeric,
                windMetric: r.hourlyUnits?.windSpeedMeric,
                humidityMetric: r.hourlyUnits?.relativeHumidityMeric,
                type: WeatherType.fromCode(weatherCode),
              );

              if (itemDataHour == currentHour) {
                emit(
                  state.copyWith(
                    isLoading: false,
                    selectedWeather: itemData,
                  ),
                );
              }

              weatherHoursData.add(itemData);
            }
          }
        }

        emit(
          state.copyWith(
            isLoading: false,
            weatherHours: weatherHoursData,
          ),
        );

        log('@@@@@result: $r');
      });
    } on ServerException catch (e) {
      log('two_factor_auth_cubit@@@getWeatherDay Error: $e');

      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  void setSelectedWeather({required WeatherInfo newData}) {
    emit(
      state.copyWith(
        selectedWeather: newData,
      ),
    );
  }
}
