import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marshather_app/presentation/screens/search/widgets/widgets.dart';

class LocationsListWidget extends StatefulWidget {
  const LocationsListWidget({super.key});

  @override
  State<LocationsListWidget> createState() => _LocationsListWidgetState();
}

class _LocationsListWidgetState extends State<LocationsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
        ),
        LocationsListItemWidget(
          itemIndex: 0.toString(),
          onDeletePressed: () => print('The Delted btn pressed!'),
          name: 'Madrid',
          time: '12:23',
          temp: '31',
        ),
        SizedBox(
          height: 20.h,
        ),
        LocationsListItemWidget(
          itemIndex: 1.toString(),
          onDeletePressed: () => print('The Delted btn pressed!'),
          name: 'Chernivtsi',
          isCurrentLocation: true,
          time: '10:23',
          temp: '31',
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
