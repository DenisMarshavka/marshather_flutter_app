part of 'home_day_hours_cubit.dart';

class HomeDayHoursState {
  const HomeDayHoursState({
    required this.selectedWeather,
    required this.weatherHours,
    this.isLoading = true,
  });
  final WeatherInfo? selectedWeather;
  final List<WeatherInfo> weatherHours;
  final bool? isLoading;

  HomeDayHoursState copyWith({
    final WeatherInfo? selectedWeather,
    final List<WeatherInfo>? weatherHours,
    final bool? isLoading,
  }) {
    return HomeDayHoursState(
      selectedWeather: selectedWeather ?? this.selectedWeather,
      weatherHours: weatherHours ?? this.weatherHours,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
