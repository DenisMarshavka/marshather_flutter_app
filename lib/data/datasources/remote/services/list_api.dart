import 'package:marshather_app/domain/usecases/usecases.dart';
import 'package:marshather_app/utils/utils.dart';

class ListApi {
  ListApi._();

  // For example
  static const String weatherForecast = '/data/2.5/forecast';

  // With query params
  static String weatherForecastDaily(WeatherForecastParams params) {
    return '/$weatherForecast/daily?q=${params.cityName}&appid=${Constants.appId}';
  }
}
