import 'package:dartz/dartz.dart';
import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class GetGeocodingPlaceLocations extends UseCase<
    List<GeocodingSearchLocationResponse>, GeocodingLocationByCityNameParams> {
  GetGeocodingPlaceLocations(this._repo);

  final GeocodingRepository _repo;

  @override
  Future<Either<Failure, List<GeocodingSearchLocationResponse>>> call(
          GeocodingLocationByCityNameParams params) =>
      _repo.getLocationsByCityName(params);
}

class GeocodingLocationByCityNameParams {
  GeocodingLocationByCityNameParams({
    required this.placeName,
  });
  final String placeName;

  Map<String, dynamic> toJson() => {
        'placeName': placeName,
      };
}
