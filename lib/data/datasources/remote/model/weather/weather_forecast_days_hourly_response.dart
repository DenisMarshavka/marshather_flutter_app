import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_days_hourly_response.g.dart';

@JsonSerializable()
class WeatherForecastDaysHourlyResponse {
  double? latitude;
  double? longitude;
  @JsonKey(name: 'generationtime_ms')
  double? generationtimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  @JsonKey(name: 'hourly_units')
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherForecastDaysHourlyResponse({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourly,
  });

  factory WeatherForecastDaysHourlyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherForecastDaysHourlyResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeatherForecastDaysHourlyResponseToJson(this);
}

@JsonSerializable()
class HourlyUnits {
  String? time;
  @JsonKey(name: 'temperature_2m')
  String? temperatureMeric;
  @JsonKey(name: 'relativehumidity_2m')
  String? relativeHumidityMeric;
  @JsonKey(name: 'windspeed_10m')
  String? windSpeedMeric;
  @JsonKey(name: 'weathercode')
  String? weatherCode;
  @JsonKey(name: 'precipitation_probability')
  String? chanceOfRainMeric;

  HourlyUnits({
    this.time,
    this.temperatureMeric,
    this.relativeHumidityMeric,
    this.windSpeedMeric,
    this.weatherCode,
    this.chanceOfRainMeric,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}

@JsonSerializable()
class Hourly {
  List<String>? time;
  @JsonKey(name: 'temperature_2m')
  List<double>? temperature2m;
  @JsonKey(name: 'relativehumidity_2m')
  List<int>? relativeHumidity2m;
  @JsonKey(name: 'windspeed_10m')
  List<double>? windSpeed10m;
  @JsonKey(name: 'weathercode')
  List<int>? weatherCode;
  @JsonKey(name: 'precipitation_probability')
  List<int>? chanceOfRain;

  Hourly({
    this.time,
    this.temperature2m,
    this.relativeHumidity2m,
    this.windSpeed10m,
    this.weatherCode,
    this.chanceOfRain,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
