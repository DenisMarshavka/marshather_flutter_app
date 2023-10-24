import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marshather_app/presentation/screens/home/cubit/cubit.dart';
import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/utils.dart';

class WeatherDetailsInfoWidget extends StatelessWidget {
  const WeatherDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: .5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Palette.textColorGrey,
              height: .7.h,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: BlocBuilder<HomeDayHoursCubit, HomeDayHoursState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherDetailsInfoItemWidget(
                    isLoading: state.isLoading == true,
                    svgAssetPath: 'assets/icons/wind.svg',
                    value:
                        '${state.selectedWeather?.windSpeed ?? '--'} ${state.selectedWeather?.windMetric ?? ''}',
                    valueName: 'Wind',
                  ),
                  WeatherDetailsInfoItemWidget(
                    isLoading: state.isLoading == true,
                    svgAssetPath: 'assets/icons/wave.svg',
                    value:
                        '${state.selectedWeather?.humidity ?? '--'} ${state.selectedWeather?.humidityMetric ?? ''}',
                    valueName: 'Humidity',
                  ),
                  WeatherDetailsInfoItemWidget(
                    isLoading: state.isLoading == true,
                    svgAssetPath: 'assets/icons/droplets.svg',
                    value:
                        '${state.selectedWeather?.rain ?? '--'} ${state.selectedWeather?.rainMetric ?? ''}',
                    valueName: 'Chance of rain',
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
