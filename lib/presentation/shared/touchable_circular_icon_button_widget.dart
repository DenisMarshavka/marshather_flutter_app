import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/presentation/shared/shared.dart';

class TouchableCircularIconButtonWidget extends StatelessWidget {
  const TouchableCircularIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.paddingAll,
    this.paddingHorizontal,
    this.paddingVertical,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final double? iconSize;
  final double? paddingAll;
  final double? paddingHorizontal;
  final double? paddingVertical;

  @override
  Widget build(BuildContext context) {
    return TouchableButtonWidget(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50.w,
          ),
          border: Border.all(
            width: 1.h,
            color: Colors.white38,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: paddingAll ?? paddingHorizontal ?? 7.w,
          vertical: paddingAll ?? paddingVertical ?? 7.w,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: iconSize ?? 20.w,
          ),
        ),
      ),
    );
  }
}
