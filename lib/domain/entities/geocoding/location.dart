part of 'geocode_location_place_info.dart';

class Location extends Equatable {
  const Location({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
