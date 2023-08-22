import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/services/services.dart';
import 'package:marshather_app/utils/utils.dart';
import 'package:vibration/vibration.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(delay: const Duration(seconds: 1));
  final SlideController _slideController = SlideController(
    usePreActionController: true,
    usePostActionController: true,
  );

  //START: State
  String _searchValue = '';
  String _searchError = '';
  bool _hasDeviceVibration = false;
  //END: State

  @override
  void initState() {
    super.initState();

    if (!isRunningInEmulator()) {
      Vibration.hasVibrator().then((val) => _hasDeviceVibration = val ?? false);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Row(
                        children: [
                          TouchableCircularIconButtonWidget(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icons.chevron_left_rounded,
                            iconSize: 30.w,
                            paddingAll: 2.w,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            'Locations',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 35.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.h,
                        horizontal: 15.w,
                      ),
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formStateKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.w),
                                color: Palette.textColorGrey,
                              ),
                              child: TextFormField(
                                controller: _searchController,
                                cursorColor: Colors.white,
                                onChanged: _handleSearchTextChanged,
                                onSaved: (newValue) => setState(
                                  () {
                                    _searchValue = newValue ?? '';
                                  },
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search for locations',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 17.sp,
                                        color: Colors.white70,
                                      ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    top: 10.h,
                                    bottom: 15.h,
                                    left: 10.w,
                                    right: 10.w,
                                  ),
                                ),
                              ),
                            ),
                            _searchError.trim().isNotEmpty
                                ? SizedBox(
                                    height: 10.h,
                                  )
                                : Container(),
                            _searchError.trim().isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Text(
                                      '* $_searchError',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.redAccent,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    //#1
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Palette.accentColorDark,
                                offset: Offset(
                                  10.w,
                                  0,
                                ),
                                blurRadius: Constants.isIos ? 20.w : 23.w,
                                spreadRadius: -5.h,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                          ),
                          child: SlidablePanel(
                            controller: _slideController,
                            key: const ValueKey(0),
                            maxSlideThreshold: 0.3,
                            axis: Axis.horizontal,
                            postActions: [
                              SizedBox(
                                width: 160.w,
                                child: TextButton(
                                  onPressed: () {
                                    _slideController.toggleAction(1);
                                  },
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
                                  onTap: () {
                                    _slideController.dismiss();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.087,
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
                                      color: Palette.accentColorDark,
                                      borderRadius: BorderRadius.circular(
                                        15.w,
                                      ),
                                      border: Border.all(
                                        width: 1.h,
                                        color: Palette.accentColorLight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Palette.accentColorDark,
                                          offset: const Offset(
                                            0,
                                            0,
                                          ),
                                          blurRadius:
                                              Constants.isIos ? 25.w : 28.w,
                                          spreadRadius: -5.h,
                                        ), //BoxShadow
                                        //BoxShadow
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Athens',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        fontSize: 25.sp,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Text(
                                              '12:23',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                    fontSize: 17.sp,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Opacity(
                                          opacity: .9,
                                          child: Text(
                                            '33°',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                              fontSize: 55.sp,
                                              shadows: [],
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
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SlidablePanel(
                          controller: _slideController,
                          key: const ValueKey(1),
                          maxSlideThreshold: 0.3,
                          axis: Axis.horizontal,
                          postActions: [
                            SizedBox(
                              width: 160.w,
                              child: TextButton(
                                onPressed: () {
                                  _slideController.toggleAction(2);
                                },
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
                          child: GestureDetector(
                            onTap: () {
                              _slideController.dismiss();
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15.w,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.087,
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
                                    color: Palette.accentColorDark,
                                    borderRadius: BorderRadius.circular(
                                      15.w,
                                    ),
                                    border: Border.all(
                                      width: 1.h,
                                      color: Palette.accentColorLight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Palette.accentColorDark,
                                        offset: const Offset(
                                          2,
                                          2,
                                        ),
                                        blurRadius:
                                            Constants.isIos ? 25.w : 28.w,
                                        spreadRadius: -10.h,
                                      ), //BoxShadow
                                      //BoxShadow
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Madrid',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 25.sp,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Icon(
                                                Icons.near_me_rounded,
                                                color: Colors.white,
                                                size: 20.sp,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Text(
                                            '10:23',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  fontSize: 17.sp,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Opacity(
                                        opacity: .9,
                                        child: Text(
                                          '31°',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                            fontSize: 55.sp,
                                            shadows: [],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSearchTextChanged(String newText) {
    setState(() {
      _searchError = '';
    });

    if (newText.trim().isNotEmpty && newText.trim().length < 5) {
      _searchError = 'Name must contain a minimum of 4 characters';
      return;
    }

    _debouncer(() {
      // Place your search logic here (e.g., API call)
      log('Searching for: $newText');
    });
  }

  Widget _renderSavedLocations() => ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15.h,
        ),
        itemCount: 3,
        itemBuilder: (context, index) => Column(
          children: [
            index != 0
                ? Container()
                : SizedBox(
                    height: 15.h,
                  ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                vertical: 25.h,
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                gradient: linearGradient(
                  null,
                  [
                    '${Palette.accentColorLightHEX} 30%',
                    Palette.accentColorLighterHEX,
                    Palette.accentColorMediumHEX,
                    Palette.accentColorDarkHEX
                  ],
                ),
                color: Palette.accentColorDark,
                borderRadius: BorderRadius.circular(
                  50.w,
                ),
                border: Border.all(
                  width: 1.h,
                  color: Palette.accentColorLight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Palette.accentColorDark,
                    offset: const Offset(
                      0,
                      0,
                    ),
                    blurRadius: 40.w,
                    spreadRadius: -10.h,
                  ), //BoxShadow
                  //BoxShadow
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Madrid',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            index != 2
                ? Container()
                : SizedBox(
                    height: 15.h,
                  ),
          ],
        ),
      );
}
