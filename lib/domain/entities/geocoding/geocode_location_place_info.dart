import 'package:equatable/equatable.dart';

part 'location.dart';

class GeocodeLocationPlaceInfo extends Equatable {
  const GeocodeLocationPlaceInfo({
    this.id,
    this.name,
    this.address,
    this.location,
    this.currentTemperature,
  });

  final int? id;
  final String? name;
  final String? address;
  final Location? location;
  final int? currentTemperature;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        location,
        currentTemperature,
      ];
}
