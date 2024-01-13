import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const appName = 'Marshather';
  static final isIos = !Platform.isAndroid;
  static const dayHours = 24;
  static final hoursWeatherItemWidthEl = 83.w;
  static final hoursWeatherItemWidthElRSpace = 25.w;
  static const appId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const baseScheme = 'https://';
  static const weatherBaseUrlDomain = 'api.open-meteo.com';
  static const geocodingBaseUrlDomain = 'geocode.maps.co';
}
