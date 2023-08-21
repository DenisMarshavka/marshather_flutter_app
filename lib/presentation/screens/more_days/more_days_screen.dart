import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/presentation/screens/more_days/more_days.dart';

import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/utils.dart';

class MoreDaysScreen extends StatefulWidget {
  const MoreDaysScreen({super.key});

  @override
  State<MoreDaysScreen> createState() => _MoreDaysScreenState();
}

class _MoreDaysScreenState extends State<MoreDaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: Constants.isIos ? null : sharedAppBar(context: context),
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
            top: Constants.isIos
                ? (MediaQuery.of(context).size.height / 100) * 8.8
                : (MediaQuery.of(context).size.height / 100) * 4.3,
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
            paddingTop: !Constants.isIos ? 27.h : 0,
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
                        Img(
                          'assets/icons/thunderstorm.svg',
                          width: 95.sp,
                          height: 95.sp,
                        ),
                        SizedBox(
                          width: 15.w,
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
                              width: Constants.isIos ? 170.sp : 180.sp,
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
                                      fontSize: Constants.isIos ? 70.sp : 64.sp,
                                      shadows: [
                                        Shadow(
                                          blurRadius:
                                              Constants.isIos ? 12.0 : 7.0,
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
                                    bottom: Constants.isIos ? 10.sp : 8.sp,
                                    right: Constants.isIos ? 5.sp : 35.sp,
                                    child: Opacity(
                                      opacity: .35,
                                      child: Text(
                                        '/17°',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: Constants.isIos
                                                  ? 40.sp
                                                  : 34.sp,
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
          Positioned(
            top: !Constants.isIos
                ? MediaQuery.of(context).size.height / 28
                : MediaQuery.of(context).size.height / 14,
            left: 20.w,
            child: TouchableCircularIconButtonWidget(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icons.chevron_left_rounded,
              iconSize: 30.w,
              paddingAll: 2.w,
            ),
          ),
        ],
      );
}
