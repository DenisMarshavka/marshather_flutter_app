import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marshather_app/core/error/error.dart';
import 'package:marshather_app/domain/entities/entities.dart';
import 'package:marshather_app/domain/usecases/usecases.dart';
import 'package:marshather_app/presentation/screens/screens.dart';
import 'package:marshather_app/utils/utils.dart';

part 'search_geocoding_locations_state.dart';

class SearchGeocodingLocationsCubit
    extends Cubit<SearchGeocodingLocationsState> {
  SearchGeocodingLocationsCubit({
    required GetGeocodingPlaceLocations getGeocodingLocationsByCityName,
    required HomeDayHoursCubit homeDayHoursCubit,
  })  : _getGeocodingLocationsByCityName = getGeocodingLocationsByCityName,
        _homeDayHoursCubit = homeDayHoursCubit,
        super(
          const SearchGeocodingLocationsState(
            locations: [],
            isLoading: false,
          ),
        );

  final GetGeocodingPlaceLocations _getGeocodingLocationsByCityName;
  final HomeDayHoursCubit _homeDayHoursCubit;

  Future<void> getGeocodingLocations(
      {required GeocodingLocationByCityNameParams params}) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          locations: List.generate(
            10,
            (index) => const GeocodeLocationPlaceInfo(),
          ),
        ),
      );

      final result = await _getGeocodingLocationsByCityName.call(params);

      result.fold((l) {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );

        log('two_factor_auth_cubit@@@getWeatherDayByLocation Error: $l');
      }, (r) async {
        final List<GeocodeLocationPlaceInfo> locations = r.map((item) {
          final List<String> addressChunks =
              item.displayName != null ? item.displayName!.split(', ') : [];
          final String cityName =
              addressChunks.isNotEmpty ? addressChunks.removeAt(0) : '-';

          return GeocodeLocationPlaceInfo(
            id: item.placeId,
            name: cityName,
            address: addressChunks.isNotEmpty
                ? addressChunks.join(', ').toString()
                : '-',
            location: Location(
              latitude:
                  item.lat != null ? double.tryParse(item.lat!) ?? 0.0 : 0.0,
              longitude:
                  item.lon != null ? double.tryParse(item.lon!) ?? 0.0 : 0.0,
            ),
            currentTemperature: 0,
          );
        }).toList();

        for (var i = 0; i < locations.length; i++) {
          final List<WeatherInfo> weatherDayHourlyInfo =
              await _homeDayHoursCubit.getWeatherDayByLocation(
                  params: WeatherForecastParams(
            latitude: locations[i].location?.latitude ?? 0.0,
            longitude: locations[i].location?.longitude ?? 0.0,
          ));

          locations[i] = GeocodeLocationPlaceInfo(
            id: locations[i].id,
            name: locations[i].name,
            address: locations[i].address,
            location: locations[i].location,
            currentTemperature: getCurrentWeatherInfoByHour(
                    weatherDayHourlyData: weatherDayHourlyInfo)
                .temperature,
          );
        }

        emit(
          state.copyWith(
            isLoading: false,
            locations: locations,
          ),
        );

        log('@@@@@result2: $locations');
      });
    } on ServerException catch (e) {
      log('two_factor_auth_cubit@@@getWeatherDayByLocation Error: $e');

      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }
}
