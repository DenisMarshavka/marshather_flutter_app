part of 'search_geocoding_locations_cubit.dart';

class SearchGeocodingLocationsState {
  const SearchGeocodingLocationsState({
    required this.locations,
    this.isLoading = true,
  });
  final List<GeocodeLocationPlaceInfo> locations;
  final bool? isLoading;

  SearchGeocodingLocationsState copyWith({
    final List<GeocodeLocationPlaceInfo>? locations,
    final bool? isLoading,
  }) {
    return SearchGeocodingLocationsState(
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
