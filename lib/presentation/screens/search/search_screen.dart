import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:marshather_app/presentation/screens/search/widgets/widgets.dart';

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

  double scrollOffset = 0.0;
  double headerHeight = Constants.isIos ? 240.h : 205.h;
  bool showHeader = true;
  //END: State

  @override
  void initState() {
    super.initState();

    if (!isRunningInEmulator()) {
      Vibration.hasVibrator().then((val) => _hasDeviceVibration = val ?? false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _handleScroll(notification.metrics.pixels);
          }

          return true;
        },
        child: Stack(
          children: [
            ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    index == 0
                        ? SizedBox(
                            height: Constants.isIos
                                ? headerHeight - 50.h
                                : headerHeight,
                          )
                        : Container(),
                    LocationsListItemWidget(
                      itemIndex: index.toString(),
                      onDeletePressed: () => print('The Delete btn pressed!'),
                      name: 'Chernivtsi',
                      isCurrentLocation: index == 0,
                      time: '10:23',
                      temp: '31',
                    ),
                  ],
                );
              },
            ),
            AnimatedPositioned(
              top: showHeader ? 0 : -headerHeight,
              duration: Duration(milliseconds: showHeader ? 200 : 450),
              left: 0,
              right: 0,
              child: Container(
                height: headerHeight,
                color: Palette
                    .backgroundColor, // Customize the header background color
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 25.h,
                    left: 15.w,
                    right: 15.w,
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Row(
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Form(
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
                                              fontSize: 13.sp,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleScroll(double offset) {
    setState(() {
      showHeader = offset < 15.h;
    });
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
}
