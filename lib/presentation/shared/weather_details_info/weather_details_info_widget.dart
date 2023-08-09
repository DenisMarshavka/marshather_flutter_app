import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              WeatherDetailsInfoItemWidget(
                svgAssetPath: 'assets/icons/wind.svg',
                value: '13 km/h',
                valueName: 'Wind',
              ),
              WeatherDetailsInfoItemWidget(
                svgAssetPath: 'assets/icons/wave.svg',
                value: '24%',
                valueName: 'Humidity',
              ),
              WeatherDetailsInfoItemWidget(
                svgAssetPath: 'assets/icons/droplets.svg',
                value: '87%',
                valueName: 'Chance of rain',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
