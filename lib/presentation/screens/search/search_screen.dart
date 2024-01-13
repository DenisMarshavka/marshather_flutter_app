import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:marshather_app/di/di.dart';
import 'package:marshather_app/domain/usecases/geocoding/get/get.dart';
import 'package:marshather_app/presentation/screens/search/cubit/cubit.dart';
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
  //Static Data
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final Debouncer _debouncer = Debouncer(delay: const Duration(seconds: 1));

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
        child: BlocBuilder<SearchGeocodingLocationsCubit,
            SearchGeocodingLocationsState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: _searchFocusNode.unfocus,
              child: SafeArea(
                child: Stack(
                  children: [
                    state.locations.isNotEmpty
                        ? ListView.separated(
                            itemCount: state.locations.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15.h),
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
                                    itemIndex:
                                        state.locations[index].toString(),
                                    onDeletePressed: () =>
                                        print('The Delete btn pressed!'),
                                    name: state.locations[index].name ?? '-',
                                    isCurrentLocation: index == 0,
                                    address:
                                        state.locations[index].address ?? '-',
                                    temp: state.locations[index]
                                            .currentTemperature ??
                                        0,
                                  ),
                                ],
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              _searchController.text.trim().isNotEmpty
                                  ? 'The location is not found'
                                  : 'List is empty',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 23.sp,
                                    color: Colors.white.withOpacity(.7),
                                  ),
                            ),
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
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.w),
                                          color: Palette.textColorGrey,
                                        ),
                                        child: TextFormField(
                                          focusNode: _searchFocusNode,
                                          controller: _searchController,
                                          cursorColor: Colors.white,
                                          onChanged: (String? val) {
                                            final String newVal = val != null &&
                                                    val.trim().isNotEmpty &&
                                                    val.trim().length > 1
                                                ? '${val[0].toUpperCase()}${val.substring(1)}'
                                                : val != null &&
                                                        val.trim().isNotEmpty
                                                    ? val.toUpperCase()
                                                    : '';

                                            _handleSearchTextChanged(newVal);
                                            _searchController.text = newVal;
                                          },
                                          onSaved: (newValue) => setState(
                                            () {
                                              _searchValue = newValue != null
                                                  ? '${newValue[0].toUpperCase()}${newValue.substring(1)}'
                                                  : '';
                                            },
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Enter a City name',
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
                                              padding:
                                                  EdgeInsets.only(left: 5.w),
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
          },
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

    if (newText.trim().isEmpty) {
      return;
    }

    if (newText.trim().isNotEmpty && newText.trim().length < 5) {
      _searchError = 'Name must contain a minimum of 4 characters';
      return;
    }

    _debouncer(() {
      // Place your search logic here (e.g., API call)
      sl<SearchGeocodingLocationsCubit>().getGeocodingLocations(
        params: GeocodingLocationByCityNameParams(
          placeName: newText,
        ),
      );
    });
  }
}
