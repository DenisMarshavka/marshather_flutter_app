import 'package:marshather_app/domain/usecases/usecases.dart';

class ListApi {
  ListApi._();

  // For example
  static const String weatherForecast = '/v1/forecast';
  static const String geocodingVersionApi = '/v1';

  // With query params
  static String weatherForecastHourly(WeatherForecastParams params) {
    return '$weatherForecast?latitude=${params.latitude}&longitude=${params.longitude}&hourly=temperature_2m,relativehumidity_2m,windspeed_10m,weathercode,precipitation_probability&past_days=0';
  }

  static String geocodingGetLocationByCityName(WeatherForecastParams params) {
    return '/$geocodingVersionApi/search?name=Черновцы&count=10&language=ru&format=json';
  }
}
