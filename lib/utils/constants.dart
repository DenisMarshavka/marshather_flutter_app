import 'dart:io';

class Constants {
  static const appName = 'Marshather';
  static final isIos = !Platform.isAndroid;
  static const appId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const baseScheme = 'https://';
  static const weatherBaseUrlDomain = 'api.openweathermap.org';
  static const weatherForecastPath = '/data/2.5/forecast/daily';
}
