import 'package:marshather_app/domain/usecases/usecases.dart';
import 'package:marshather_app/utils/utils.dart';

class ListApi {
  ListApi._();

  // For example
  static const String weatherForecast = '/data/2.5/forecast';
  static const String geocodingVersionApi = '/v1';

  // With query params
  static String weatherForecastDaily(WeatherForecastParams params) {
    return '/$weatherForecast/daily?q=${params.cityName}&appid=${Constants.appId}';
  }

  static String weatherForecastHourly(WeatherForecastParams params) {
    return '/$weatherForecast/hourly?q=${params.cityName}&appid=${Constants.appId}';
  }

  static String geocodingGetLocationByCityName(WeatherForecastParams params) {
    return '/$geocodingVersionApi/search?name=Черновцы&count=10&language=ru&format=json';
  }
}
