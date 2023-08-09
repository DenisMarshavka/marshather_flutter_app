import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'hours_weather_section.dart';

class HoursWeatherSectionWidget extends StatefulWidget {
  const HoursWeatherSectionWidget({super.key});

  @override
  State<HoursWeatherSectionWidget> createState() =>
      _HoursWeatherSectionWidgetState();
}

class _HoursWeatherSectionWidgetState extends State<HoursWeatherSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15.h,
        ),
        height: MediaQuery.of(context).size.height / 5,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            width: 15.w,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) => Row(
            children: [
              index != 0
                  ? Container()
                  : SizedBox(
                      width: 25.w,
                    ),
              HoursWeatherItemWidget(
                isActive: index == 1,
                temp: 20 + index,
                weatherSvgAssetsPath: 'assets/icons/cloudy.svg',
                hours: '0$index:00',
              ),
              index != 6
                  ? Container()
                  : SizedBox(
                      width: 25.w,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
