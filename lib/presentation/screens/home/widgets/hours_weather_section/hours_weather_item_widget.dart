import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:marshather_app/utils/utils.dart';

class HoursWeatherItemWidget extends StatelessWidget {
  const HoursWeatherItemWidget({
    super.key,
    required this.temp,
    required this.weatherSvgAssetsPath,
    required this.hours,
    this.isActive = false,
  });
  final int temp;
  final String weatherSvgAssetsPath;
  final String hours;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: !isActive ? 10.h : 12.h,
        horizontal: !isActive ? 15.w : 17.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.h,
          color:
              !isActive ? Palette.textColorGreyer : Palette.accentColorLighting,
        ),
        borderRadius: BorderRadius.circular(
          27.w,
        ),
        gradient: !isActive
            ? null
            : linearGradient(
                null,
                [
                  '${Palette.accentColorLighterHEX} 2%',
                  Palette.accentColorLighterHEX,
                  Palette.accentColorDarkHEX
                ],
              ),
        boxShadow: !isActive
            ? null
            : [
                BoxShadow(
                  color: Palette.accentColorLight,
                  offset: const Offset(
                    0,
                    0,
                  ),
                  blurRadius: 18.2.w,
                  spreadRadius: Constants.isIos ? -5.h : -10.h,
                ), //BoxShadow
                //BoxShadow
              ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$temp°',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: !isActive ? 18.sp : 23.sp,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset(
            weatherSvgAssetsPath,
            height: 40.h,
            width: 45.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            hours,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: !isActive ? 12.sp : 14.sp,
                  color: !isActive ? Palette.textColorGrey : Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
