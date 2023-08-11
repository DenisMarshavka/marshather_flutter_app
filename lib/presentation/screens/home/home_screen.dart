import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marshather_app/presentation/screens/home/widgets/widgets.dart';
import 'package:marshather_app/presentation/shared/shared.dart';
import 'package:marshather_app/utils/router.dart';
import 'package:marshather_app/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: Constants.isIos ? null : sharedAppBar(context: context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            _renderInfoBox(),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 23.sp,
                                ),
                      ),
                      TouchableButton(
                        onPressed: () =>
                            AppRoute.router.goNamed(Routes.moreDaysPage.name),
                        child: Row(
                          children: [
                            Text(
                              '7 days',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16.sp,
                                  ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Palette.textColorGrey,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const HoursWeatherSectionWidget(),
          ],
        ),
      ),
    );
  }

  Widget _renderInfoBox() => Stack(
        children: [
          Positioned(
            top: !Constants.isIos
                ? (MediaQuery.of(context).size.height / 100) * 11.8
                : (MediaQuery.of(context).size.height / 100) * 10.8,
            left: (MediaQuery.of(context).size.width / 100) * 1.82,
            child: Opacity(
              opacity: 0.3, // Set the opacity value here (between 0.0 and 1.0).
              child: Container(
                height: (MediaQuery.of(context).size.height / 100) * 60,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: Palette.accentColorDark,
                  border: Border.all(
                    width: 1.h,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                    55.w,
                  ),
                ),
              ),
            ),
          ),
          WeatherGradientBoxWidget(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/cloudy.svg',
                  height: 150.h,
                  width: 160.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const MetricValueWidget(
                  value: '21',
                ),
                Text(
                  'Thunderstorm',
                  style: GoogleFonts.rubik(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        blurRadius: 4.0, // shadow blur
                        color: Colors.black45, // shadow color
                        offset:
                            Offset(0.0, 0.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Monday, 17 May',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Positioned(
            top: !Constants.isIos
                ? MediaQuery.of(context).size.height / 28
                : MediaQuery.of(context).size.height / 14,
            left: 20.w,
            child: TouchableButton(
              onPressed: () => context,
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
                  horizontal: 7.w,
                  vertical: 7.w,
                ),
                child: Center(
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 20.w,
                  ),
                ),
              ),
            ),
          )
        ],
      );
}
