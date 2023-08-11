import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/utils.dart';

class WeatherGradientBoxWidget extends StatelessWidget {
  WeatherGradientBoxWidget({
    super.key,
    required this.child,
    this.paddingBottom,
    this.paddingTop,
    this.offsetTopContent = true,
  });
  Widget child;
  double? paddingBottom;
  double? paddingTop;
  bool? offsetTopContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.h,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: linearGradient(
          null,
          [
            '${Palette.accentColorLightHEX} 30%',
            Palette.accentColorLighterHEX,
            Palette.accentColorMediumHEX,
            Palette.accentColorDarkHEX
          ],
        ),
        color: Palette.accentColorDark,
        borderRadius: BorderRadius.circular(
          50.w,
        ),
        border: Border.all(
          width: 2.h,
          color: Palette.accentColorLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Palette.accentColorDark,
            offset: Offset(
              0,
              !Platform.isAndroid ? 0 : -4.h,
            ),
            blurRadius: !Platform.isAndroid ? 35.w : 40.w,
            spreadRadius: !Platform.isAndroid ? -10.h : -15.h,
          ), //BoxShadow
          //BoxShadow
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop ?? 40.h,
          left: 30.w,
          right: 30.w,
          bottom: paddingBottom ?? 30.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            offsetTopContent == true
                ? SizedBox(
                    height: 13.h,
                  )
                : Container(),
            child,
            SizedBox(
              height: 15.h,
            ),
            const WeatherDetailsInfoWidget(),
          ],
        ),
      ),
    );
  }
}
