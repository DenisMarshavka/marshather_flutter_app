import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marshather_app/domain/entities/entities.dart';
import 'package:marshather_app/presentation/screens/home/cubit/cubit.dart';
import 'package:marshather_app/utils/utils.dart';

import 'hours_weather_section.dart';

class HoursWeatherSectionWidget extends StatefulWidget {
  const HoursWeatherSectionWidget({
    super.key,
    required this.onChangeActiveIndex,
    this.activeIndex,
  });
  final int? activeIndex;
  final void Function(int newIndex) onChangeActiveIndex;

  @override
  State<HoursWeatherSectionWidget> createState() =>
      _HoursWeatherSectionWidgetState();
}

class _HoursWeatherSectionWidgetState extends State<HoursWeatherSectionWidget> {
  late ScrollController _scrollController;
  bool _initScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 15.h,
        ),
        height: MediaQuery.of(context).size.height / 5,
        child: BlocBuilder<HomeDayHoursCubit, HomeDayHoursState>(
          builder: (context, state) {
            final List<WeatherInfo> mockListData =
                List.filled(6, const WeatherInfo());
            final List<WeatherInfo> listData =
                state.isLoading == true ? mockListData : state.weatherHours;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!_initScrolled && state.isLoading == false) {
                if (widget.activeIndex != null) {
                  _scrollController.jumpTo(
                    widget.activeIndex! *
                        (Constants.hoursWeatherItemWidthEl +
                            (Constants.hoursWeatherItemWidthElRSpace / 2)),
                  );

                  setState(() {
                    _initScrolled = true;
                  });
                } else {
                  _scrollController.jumpTo(0);
                }
              }
            });

            return ListView.separated(
              controller: _scrollController,
              separatorBuilder: (context, index) => SizedBox(
                width: 15.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                final WeatherInfo currentItemData = listData[index];

                return Row(
                  children: [
                    index != 0
                        ? Container()
                        : SizedBox(
                            width:
                                Constants.hoursWeatherItemWidthElRSpace + 10.w,
                          ),
                    GestureDetector(
                      onTap: () => state.isLoading == true
                          ? null
                          : widget.onChangeActiveIndex(index),
                      child: HoursWeatherItemWidget(
                        isLoading: state.isLoading == true,
                        isActive: index == widget.activeIndex,
                        temp: currentItemData.temperature ?? 0,
                        weatherSvgAssetsPath: currentItemData.time != null &&
                                currentItemData.type != null
                            ? getWeatherImgSrcByType(
                                type: currentItemData.type!,
                                data: currentItemData,
                              )
                            : 'assets/icons/cloudy.svg',
                        hours: currentItemData.time != null
                            ? currentItemData.time!.split('T')[1]
                            : '',
                      ),
                    ),
                    index != state.weatherHours.length - 1
                        ? Container()
                        : SizedBox(
                            width:
                                Constants.hoursWeatherItemWidthElRSpace + 10.w,
                          ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
