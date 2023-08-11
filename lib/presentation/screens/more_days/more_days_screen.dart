import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marshather_app/presentation/screens/more_days/more_days.dart';

import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/utils.dart';

class SevenDaysScreen extends StatefulWidget {
  const SevenDaysScreen({super.key});

  @override
  State<SevenDaysScreen> createState() => _SevenDaysScreenState();
}

class _SevenDaysScreenState extends State<SevenDaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: !Platform.isAndroid ? null : sharedAppBar(context: context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              _renderInfoBox(),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 35.h,
                ),
                child: const WeatherDaysListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderInfoBox() => Stack(
        children: [
          Positioned(
            top: Platform.isAndroid
                ? (MediaQuery.of(context).size.height / 100) * 6
                : (MediaQuery.of(context).size.height / 100) * 7.5,
            left: (MediaQuery.of(context).size.width / 100) * 1.82,
            child: Opacity(
              opacity: 0.3, // Set the opacity value here (between 0.0 and 1.0).
              child: Container(
                height: (MediaQuery.of(context).size.height / 100) * 43,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Palette.accentColorDark,
                  border: Border.all(
                    width: 1.h,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                    55.w,
                  ),
                ),
              ),
            ),
          ),
          WeatherGradientBoxWidget(
            offsetTopContent: false,
            paddingBottom: 35.h,
            paddingTop: Platform.isAndroid ? 15.h : 0,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 19.sp,
                          color: Colors.white,
                        ),
                        Text(
                          ' 7 days',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 29.sp,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/thunderstorm.svg',
                          width: !Platform.isAndroid ? 95.sp : 130.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tommorow',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 21.sp,
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(
                              width: !Platform.isAndroid ? 170.sp : 215.sp,
                              child: Stack(
                                //crossAxisAlignment: CrossAxisAlignment.baseline,
                                //textBaseline: TextBaseline.alphabetic,
                                children: [
                                  MetricValueWidget(
                                    value: '20',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                      fontSize:
                                          !Platform.isAndroid ? 70.sp : 90.sp,
                                      shadows: [
                                        Shadow(
                                          blurRadius:
                                              !Platform.isAndroid ? 12.0 : 7.0,
                                          color: Colors.white24,
                                          offset: const Offset(
                                            0.0,
                                            0.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    withCelsius: false,
                                  ),
                                  Positioned(
                                    bottom: !Platform.isAndroid ? 10.sp : 15.sp,
                                    right: 0,
                                    child: Opacity(
                                      opacity: .35,
                                      child: Text(
                                        '/17°',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: !Platform.isAndroid
                                                  ? 40.sp
                                                  : 50.sp,
                                              color: Colors.white,
                                              shadows: null,
                                            ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'Thunderstorm',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
