import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bottom_hours_carousel_state.dart';

class HomeBottomHoursCarouselCubit extends Cubit<HomeBottomHoursCarouselState> {
  HomeBottomHoursCarouselCubit()
      : super(
          const HomeBottomHoursCarouselState(
            activeHoursItem: 0,
          ),
        );

  void setSelectedIndex({required int selectedIndex}) {
    emit(HomeBottomHoursCarouselState(activeHoursItem: selectedIndex));
  }
}
