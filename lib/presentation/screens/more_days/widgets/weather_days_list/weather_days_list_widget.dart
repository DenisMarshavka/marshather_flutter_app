import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/presentation/screens/more_days/widgets/widgets.dart';

class WeatherDaysListWidget extends StatelessWidget {
  const WeatherDaysListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherDaysItemWidget(
          day: 'Mon',
          wetherImageSrc: 'assets/icons/cloudy.svg',
          weatherName: 'Cloudy',
          maxTemp: '+20',
          minTemp: '+14',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Tue',
          wetherImageSrc: 'assets/icons/thunderstorm.svg',
          weatherName: 'Thunder',
          maxTemp: '+14',
          minTemp: '+7',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Wed',
          wetherImageSrc: 'assets/icons/thunderstorm.svg',
          weatherName: 'Thunder',
          maxTemp: '+16',
          minTemp: '+11',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Thu',
          wetherImageSrc: 'assets/icons/thunderstorm.svg',
          weatherName: 'Thunder',
          maxTemp: '+18',
          minTemp: '+11',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Fri',
          wetherImageSrc: 'assets/icons/thunderstorm.svg',
          weatherName: 'Rainy',
          maxTemp: '+8',
          minTemp: '+1',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Sat',
          wetherImageSrc: 'assets/icons/thunderstorm.svg',
          weatherName: 'Storm',
          maxTemp: '+11',
          minTemp: '+5',
        ),
        SizedBox(
          height: 45.h,
        ),
        WeatherDaysItemWidget(
          day: 'Sun',
          wetherImageSrc: 'assets/icons/cloudy.svg',
          weatherName: 'Cloudy',
          maxTemp: '+16',
          minTemp: '+14',
        ),
      ],
    );
  }
}
