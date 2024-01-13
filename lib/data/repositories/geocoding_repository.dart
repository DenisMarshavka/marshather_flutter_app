import 'dart:async';
import 'package:dartz/dartz.dart';

import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/data.dart';
import 'package:marshather_app/domain/domain.dart';

class GeocodingRepositoryImpl extends GeocodingRepository {
  GeocodingRepositoryImpl(this.geocodingRemoteDatasource);
  final GeocodingRemoteDatasource geocodingRemoteDatasource;

  @override
  Future<Either<Failure, List<GeocodingSearchLocationResponse>>>
      getLocationsByCityName(
    GeocodingLocationByCityNameParams params,
  ) async {
    try {
      final response =
          await geocodingRemoteDatasource.getLocationsByCityName(params);

      return Right(
        response
            .map(
              (item) => GeocodingSearchLocationResponse(
                placeId: item.placeId,
                licence: item.licence,
                poweredBy: item.poweredBy,
                osmType: item.osmType,
                osmId: item.osmId,
                boundingbox: item.boundingbox,
                lat: item.lat,
                lon: item.lon,
                displayName: item.displayName,
                type: item.type,
                importance: item.importance,
              ),
            )
            .toList(),
      );
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
