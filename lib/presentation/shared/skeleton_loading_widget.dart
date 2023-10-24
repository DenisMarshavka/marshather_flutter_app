import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:marshather_app/utils/utils.dart';

class SkeletonLoadingWidget extends StatelessWidget {
  const SkeletonLoadingWidget({
    super.key,
    this.containerPadding,
    this.containerHeight,
    this.elBorderRadius,
    this.bgLoadingColor,
    this.loaderLoadingColor,
    required this.elHeight,
    required this.elWidth,
  });
  final double elWidth;
  final double elHeight;
  final double? elBorderRadius;
  final double? containerHeight;
  final Color? bgLoadingColor;
  final Color? loaderLoadingColor;
  final EdgeInsetsGeometry? containerPadding;

  @override
  Widget build(BuildContext context) {
    final double defaultBorderRadius = 10.w;
    final Color baseColor = Palette.accentColorLight;
    final Color highlightColor = Palette.accentColorDark;

    return SizedBox(
      height: containerHeight ?? elHeight,
      width: elWidth,
      child: Stack(
        children: [
          Positioned.fill(
            top: !Constants.isIos ? 0 : -50.h,
            child: Container(
              padding: containerPadding,
              height: containerHeight ?? elHeight,
              child: OverflowBox(
                maxHeight: double.infinity,
                child: SkeletonLoader(
                  builder: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: elWidth,
                        height: elHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            elBorderRadius ?? defaultBorderRadius,
                          ),
                          border: Border.all(
                            width: 1,
                            color: Colors.transparent,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  period: const Duration(seconds: 2),
                  baseColor: bgLoadingColor ?? baseColor,
                  highlightColor: loaderLoadingColor ?? highlightColor,
                  direction: SkeletonDirection.ltr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
