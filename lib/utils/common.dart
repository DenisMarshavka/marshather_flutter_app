import 'package:logger/logger.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/entities/entities.dart';

final prettyLog = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 110,
  ),
);

bool isNight(String? time) {
  final DateTime parsedTime =
      time != null ? DateTime.parse(time) : DateTime.now();
  final int currentHour = parsedTime.hour;
  return currentHour < 6 || currentHour >= 20;
}

String getWeatherImgSrcByType({
  required WeatherType type,
  required WeatherInfo data,
}) =>
    !isNight(data.time) ? type.iconSrc : type.iconNightSrc ?? type.iconSrc;

String getWeatherNameByCode({
  required int code,
  required WeatherInfo data,
}) {
  final int weatherTypeIndex =
      WeatherType.values.indexWhere((weather) => weather.codes.contains(code));
  final WeatherType currentWeatherType = WeatherType.values[weatherTypeIndex];
  final int weatherCodeIndex =
      currentWeatherType.codes.indexWhere((code) => code == code);
  final WeatherName weatherName = currentWeatherType.value[weatherCodeIndex];

  return !isNight(data.time) ? weatherName.day : weatherName.night;
}
