import 'package:equatable/equatable.dart';
import 'package:marshather_app/data/datasources/remote/remote.dart';

class WeatherInfo extends Equatable {
  const WeatherInfo({
    this.temperature,
    this.time,
    this.windSpeed,
    this.weatherCode,
    this.humidity,
    this.rain,
    this.rainMetric,
    this.windMetric,
    this.humidityMetric,
    this.type,
  });

  final int? temperature;
  final String? time;
  final int? windSpeed;
  final int? weatherCode;
  final int? humidity;
  final int? rain;
  final String? rainMetric;
  final String? windMetric;
  final String? humidityMetric;
  final WeatherType? type;

  @override
  List<Object?> get props => [
        temperature,
        time,
        windSpeed,
        weatherCode,
        humidity,
        rain,
        rainMetric,
        windMetric,
        humidityMetric,
        type,
      ];
}
