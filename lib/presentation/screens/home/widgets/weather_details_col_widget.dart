import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetailsColWidget extends StatelessWidget {
  const WeatherDetailsColWidget({
    super.key,
    required this.svgAssetPath,
    required this.value,
    required this.valueName,
  });
  final String svgAssetPath;
  final String value;
  final String valueName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Img(
          svgAssetPath,
          height: 17.h,
          width: 20.w,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp,
              ),
        ),
        Text(
          valueName,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }
}
