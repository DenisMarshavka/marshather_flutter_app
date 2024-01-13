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

WeatherInfo getCurrentWeatherInfoByHour({
  required List<WeatherInfo> weatherDayHourlyData,
}) {
  final DateTime currentTime = DateTime.now();
  final int currentTimeHour = currentTime.hour;

  final List<WeatherInfo> currentItemTime = weatherDayHourlyData
      .where((element) =>
          element.time != null &&
          DateTime.tryParse(element.time!)?.hour != null &&
          DateTime.tryParse(element.time!)!.hour == currentTimeHour)
      .toList();

  return currentItemTime.isNotEmpty
      ? currentItemTime.first
      : const WeatherInfo();
}

bool isCurrentWeatherInfoByHour({
  required WeatherInfo weatherDayHourlyData,
}) {
  final DateTime currentTime = DateTime.now();
  final int currentTimeHour = currentTime.hour;

  if (weatherDayHourlyData.time == null) return false;

  final DateTime? dataTime = DateTime.tryParse(weatherDayHourlyData.time!);

  if (dataTime == null) return false;
  return currentTimeHour == dataTime.hour;
}
