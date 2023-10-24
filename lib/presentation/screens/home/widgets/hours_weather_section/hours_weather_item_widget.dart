import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/utils.dart';

class HoursWeatherItemWidget extends StatelessWidget {
  const HoursWeatherItemWidget({
    super.key,
    required this.temp,
    required this.weatherSvgAssetsPath,
    required this.hours,
    this.isActive = false,
    this.isLoading = false,
  });
  final int temp;
  final String weatherSvgAssetsPath;
  final String hours;
  final bool isActive;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.hoursWeatherItemWidthEl,
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
          isLoading == true
              ? SkeletonLoadingWidget(
                  containerPadding: EdgeInsets.only(
                    top: 3.sp,
                  ),
                  elWidth: 21.sp,
                  elHeight: 16.sp,
                  containerHeight: 19.sp,
                  elBorderRadius: 5.w,
                  bgLoadingColor: Palette.backgroundColor,
                  loaderLoadingColor: Palette.accentColorVeryDark,
                )
              : Text(
                  '$temp°',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: !isActive ? 18.sp : 23.sp,
                      ),
                ),
          SizedBox(
            height: 10.h,
          ),
          isLoading == true
              ? SkeletonLoadingWidget(
                  elWidth: 49.w,
                  elHeight: 39.h,
                  containerHeight: 40.h,
                  elBorderRadius: 5.w,
                  bgLoadingColor: Palette.backgroundColor,
                  loaderLoadingColor: Palette.accentColorVeryDark,
                )
              : Img(
                  weatherSvgAssetsPath,
                  height: 40.h,
                  width: 45.w,
                ),
          SizedBox(
            height: 10.h,
          ),
          isLoading == true
              ? SkeletonLoadingWidget(
                  containerPadding: EdgeInsets.only(
                    top: 3.sp,
                  ),
                  elWidth: 37.sp,
                  elHeight: 11.sp,
                  containerHeight: 16.sp,
                  elBorderRadius: 5.w,
                  bgLoadingColor: Palette.backgroundColor,
                  loaderLoadingColor: Palette.accentColorVeryDark,
                )
              : Text(
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
