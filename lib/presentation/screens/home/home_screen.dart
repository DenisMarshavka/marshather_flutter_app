import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:marshather_app/di/di.dart';
import 'package:marshather_app/domain/usecases/usecases.dart';
import 'package:marshather_app/presentation/screens/home/cubit/cubit.dart';
import 'package:marshather_app/presentation/screens/home/widgets/widgets.dart';
import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/router.dart';
import 'package:marshather_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _latitude = 48.29045;
  double _longitude = 25.93241;
  String _weatherCity = 'Chernivtsi';
  int? _bottomHoursActiveItemInex;

  @override
  void initState() {
    super.initState();

    sl<HomeDayHoursCubit>().getWeatherDayByLocation(
      params: WeatherForecastParams(latitude: _latitude, longitude: _longitude),
    );

    if (Constants.isIos) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: Constants.isIos ? null : sharedAppBar(context: context),
      body: BlocListener<HomeDayHoursCubit, HomeDayHoursState>(
        listenWhen: (previous, current) {
          return previous.weatherHours != current.weatherHours;
        },
        listener: (context, state) {
          for (var i = 0; i < state.weatherHours.length; i++) {
            if (isCurrentWeatherInfoByHour(
                weatherDayHourlyData: state.weatherHours[i])) {
              setState(() {
                _bottomHoursActiveItemInex = i;
              });

              break;
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: _renderInfoBox(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 23.sp,
                                  ),
                        ),
                        TouchableButtonWidget(
                          onPressed: () =>
                              AppRoute.router.goNamed(Routes.moreDaysPage.name),
                          child: Row(
                            children: [
                              Text(
                                '7 days',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontSize: 16.sp,
                                    ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Palette.textColorGrey,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeDayHoursCubit, HomeDayHoursState>(
                builder: (context, state) {
                  return HoursWeatherSectionWidget(
                    activeIndex: _bottomHoursActiveItemInex,
                    onChangeActiveIndex: (int newIndex) {
                      sl<HomeDayHoursCubit>().setSelectedWeather(
                        newData: state.weatherHours[newIndex],
                      );

                      setState(() {
                        _bottomHoursActiveItemInex = newIndex;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderInfoBox() {
    final double topContentOffset = !Constants.isIos
        ? MediaQuery.of(context).size.height / 28
        : MediaQuery.of(context).size.height / 14;

    return Stack(
      children: [
        Positioned(
          top: !Constants.isIos
              ? (MediaQuery.of(context).size.height / 100) * 8
              : (MediaQuery.of(context).size.height / 100) * 9,
          left: (MediaQuery.of(context).size.width / 100) * 1.82,
          child: Opacity(
            opacity: 0.3, // Set the opacity value here (between 0.0 and 1.0).
            child: Container(
              height: (MediaQuery.of(context).size.height / 100) * 70,
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
          child: BlocBuilder<HomeDayHoursCubit, HomeDayHoursState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.isLoading == true
                      ? SizedBox(
                          height: Constants.isIos ? 30.5.h : 29.5.h,
                        )
                      : Container(),
                  state.isLoading == true
                      ? SkeletonLoadingWidget(
                          containerPadding: EdgeInsets.only(
                            top: 90.h,
                            bottom: 10.h,
                          ),
                          elWidth: 175.w,
                          elHeight: 180.h,
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            top: 25.h,
                          ),
                          child: Img(
                            state.selectedWeather != null &&
                                    state.selectedWeather?.time != null &&
                                    state.selectedWeather?.type != null
                                ? getWeatherImgSrcByType(
                                    type: state.selectedWeather!.type!,
                                    data: state.selectedWeather!,
                                  )
                                : 'assets/icons/cloudy.svg',
                            height: 180.h,
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  state.isLoading == true
                      ? SkeletonLoadingWidget(
                          containerPadding: EdgeInsets.only(
                            top: 100.sp,
                            bottom: 95.sp,
                          ),
                          containerHeight: 144.sp,
                          elWidth: 175.sp,
                          elHeight: 100.sp,
                        )
                      : MetricValueWidget(
                          value: '${state.selectedWeather?.temperature ?? '-'}',
                        ),
                  state.isLoading == true
                      ? SkeletonLoadingWidget(
                          containerPadding: EdgeInsets.only(
                            top: Constants.isIos ? 28.sp : 35.sp,
                          ),
                          elWidth: 175.sp,
                          elHeight: 30.sp,
                        )
                      : AutoSizeText(
                          state.selectedWeather != null &&
                                  state.selectedWeather?.weatherCode != null
                              ? getWeatherNameByCode(
                                  code: state.selectedWeather!.weatherCode!,
                                  data: state.selectedWeather!,
                                )
                              : '---',
                          maxLines: 1,
                          style: GoogleFonts.rubik(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                blurRadius: 4.0, // shadow blur
                                color: Colors.black45, // shadow color
                                offset: Offset(
                                    0.0, 0.0), // how much shadow will be shown
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${DateFormat('EEEE').format(state.selectedWeather?.time != null ? DateTime.parse(state.selectedWeather!.time!) : DateTime.now())}, ${state.selectedWeather?.time != null ? DateTime.parse(state.selectedWeather!.time!).day : DateTime.now().day} ${DateFormat('MMMM').format(state.selectedWeather?.time != null ? DateTime.parse(state.selectedWeather!.time!) : DateTime.now())}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          top: topContentOffset,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 19.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                _weatherCity,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        //The Geolocation button
        Positioned(
          top: topContentOffset,
          left: 20.w,
          child: TouchableCircularIconButtonWidget(
            icon: Icons.gps_fixed,
            onPressed: () => log('Geolocation pressed!'),
          ),
        ),
        //The Search button
        Positioned(
          top: topContentOffset,
          right: 20.w,
          child: TouchableCircularIconButtonWidget(
            icon: Icons.search_outlined,
            onPressed: () {
              setState(() {
                _bottomHoursActiveItemInex = null;
              });

              AppRoute.router.goNamed(Routes.searchPage.name);
            },
          ),
        )
      ],
    );
  }
}
