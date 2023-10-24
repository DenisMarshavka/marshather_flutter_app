import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/presentation/shared/shared.dart';

class WeatherDetailsInfoItemWidget extends StatelessWidget {
  const WeatherDetailsInfoItemWidget({
    super.key,
    required this.svgAssetPath,
    required this.value,
    required this.valueName,
    this.isLoading = false,
  });
  final String svgAssetPath;
  final String value;
  final String valueName;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          Img(
            svgAssetPath,
            height: 25.h,
            width: 35.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          isLoading == true
              ? SkeletonLoadingWidget(
                  containerPadding: EdgeInsets.only(
                    top: 30.sp,
                  ),
                  elWidth: 60.sp,
                  elHeight: 14.sp,
                  containerHeight: 16.sp,
                  elBorderRadius: 5.w,
                )
              : Text(
                  value,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
          AutoSizeText(
            valueName,
            maxLines: 1,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 14.sp,
                ),
          ),
        ],
      ),
    );
  }
}
