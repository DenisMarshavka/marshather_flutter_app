import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:marshather_app/utils/utils.dart';

class LocationsListItemWidget extends StatefulWidget {
  const LocationsListItemWidget({
    super.key,
    required this.itemIndex,
    required this.onDeletePressed,
    required this.name,
    required this.address,
    required this.temp,
    this.isCurrentLocation = false,
  });
  final String itemIndex;
  final VoidCallback onDeletePressed;
  final String name;
  final String address;
  final num temp;
  final bool? isCurrentLocation;

  @override
  State<LocationsListItemWidget> createState() =>
      _LocationsListItemWidgetState();
}

class _LocationsListItemWidgetState extends State<LocationsListItemWidget> {
  final SlideController _slideController = SlideController(
    usePostActionController: true,
    usePreActionController: true,
  );

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SlidablePanel(
          controller: _slideController,
          key: ValueKey(widget.itemIndex),
          maxSlideThreshold: 0.3,
          axis: Axis.horizontal,
          postActions: [
            SizedBox(
              width: 160.w,
              child: TextButton(
                onPressed: widget.onDeletePressed,
                child: SizedBox(
                  width: 85.w,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15.w,
                      ),
                      border: Border.all(
                        width: 0,
                        color: Colors.transparent,
                      ),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 45.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          child: Row(
            children: [
              SizedBox(
                width: 15.w,
              ),
              GestureDetector(
                onTap: () => _slideController.dismiss(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.087,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    gradient: linearGradient(
                      null,
                      [
                        '${Palette.accentColorLightHEX} 40%',
                        Palette.accentColorLighterHEX,
                        Palette.accentColorDarkHEX
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                      15.w,
                    ),
                    border: Border.all(
                      width: 1.h,
                      color: Palette.accentColorLight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              widget.isCurrentLocation == true
                                  ? Icon(
                                      Icons.near_me_rounded,
                                      color: Colors.white,
                                      size: 20.sp,
                                    )
                                  : Container(),
                              widget.isCurrentLocation == true
                                  ? SizedBox(
                                      width: 12.w,
                                    )
                                  : Container(),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.4,
                                child: AutoSizeText(
                                  widget.name,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 25.sp,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.9,
                            child: AutoSizeText(
                              widget.address,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Opacity(
                        opacity: .9,
                        child: Text(
                          '${widget.temp.ceil()}°',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 55.sp,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
