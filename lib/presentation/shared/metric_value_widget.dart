import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/utils/utils.dart';

class MetricValueWidget extends StatelessWidget {
  const MetricValueWidget({
    super.key,
    required this.value,
    this.fontSize,
    this.style,
    this.fontSizeCelsius,
    this.isCelsiusWhiteColor = false,
    this.withCelsius = true,
  });
  final String value;
  final TextStyle? style;
  final num? fontSize;
  final num? fontSizeCelsius;
  final bool? isCelsiusWhiteColor;
  final bool? withCelsius;

  @override
  Widget build(BuildContext context) {
    double valueFontSize = fontSize?.toDouble() ?? 125.sp;
    double celsiusFontSize = fontSizeCelsius?.toDouble() ?? 35.sp;

    return Stack(
      children: [
        Text(
          '$value ',
          style: style ??
              Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: valueFontSize,
                  ),
        ),
        withCelsius == true
            ? Positioned(
                top: valueFontSize / 6.h,
                right: 0,
                child: Text(
                  '°',
                  style: TextStyle(
                    fontSize: celsiusFontSize,
                    color: isCelsiusWhiteColor == false
                        ? Palette.textColorGrey
                        : Colors.white,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
