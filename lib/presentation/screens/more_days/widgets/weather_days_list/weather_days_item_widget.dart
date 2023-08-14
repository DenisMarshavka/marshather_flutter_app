import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDaysItemWidget extends StatelessWidget {
  WeatherDaysItemWidget({
    super.key,
    required this.day,
    required this.wetherImageSrc,
    required this.weatherName,
    required this.maxTemp,
    required this.minTemp,
  });
  String day;
  String wetherImageSrc;
  String weatherName;
  String maxTemp;
  String minTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.sp,
            child: Text(
              day,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 17.sp,
                  ),
            ),
          ),
          SizedBox(
            width: 115.sp,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Img(
                  wetherImageSrc,
                  width: 25.w,
                  height: 25.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  weatherName,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 17.sp,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80.sp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$maxTemp°',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 17.sp,
                        color: Colors.white,
                      ),
                ),
                Text(
                  '$minTemp°',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 17.sp,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
