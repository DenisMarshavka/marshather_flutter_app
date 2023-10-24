// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_days_hourly_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDaysHourlyResponse _$WeatherForecastDaysHourlyResponseFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastDaysHourlyResponse(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int?,
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezoneAbbreviation'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
      hourlyUnits: json['hourly_units'] == null
          ? null
          : HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastDaysHourlyResponseToJson(
        WeatherForecastDaysHourlyResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezoneAbbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      time: json['time'] as String?,
      temperatureMeric: json['temperature_2m'] as String?,
      relativeHumidityMeric: json['relativehumidity_2m'] as String?,
      windSpeedMeric: json['windspeed_10m'] as String?,
      weatherCode: json['weathercode'] as String?,
      chanceOfRainMeric: json['precipitation_probability'] as String?,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperatureMeric,
      'relativehumidity_2m': instance.relativeHumidityMeric,
      'windspeed_10m': instance.windSpeedMeric,
      'weathercode': instance.weatherCode,
      'precipitation_probability': instance.chanceOfRainMeric,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      relativeHumidity2m: (json['relativehumidity_2m'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      windSpeed10m: (json['windspeed_10m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      chanceOfRain: (json['precipitation_probability'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'relativehumidity_2m': instance.relativeHumidity2m,
      'windspeed_10m': instance.windSpeed10m,
      'weathercode': instance.weatherCode,
      'precipitation_probability': instance.chanceOfRain,
    };
