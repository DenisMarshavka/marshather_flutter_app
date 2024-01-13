import 'package:marshather_app/core/core.dart';
import 'package:marshather_app/data/datasources/remote/remote.dart';
import 'package:marshather_app/domain/usecases/usecases.dart';

abstract class GeocodingRemoteDatasource {
  Future<List<GeocodingSearchLocationResponse>> getLocationsByCityName(
      GeocodingLocationByCityNameParams params);
}

class GeocodingRemoteDatasourceImpl implements GeocodingRemoteDatasource {
  GeocodingRemoteDatasourceImpl(
    this._client,
    this._noTokenClient,
  );

  final DioGeocodingClient _client;
  final NoTokenDioGeocodingClient _noTokenClient;

  @override
  Future<List<GeocodingSearchLocationResponse>> getLocationsByCityName(
    GeocodingLocationByCityNameParams registerParams,
  ) async {
    try {
      final response = await _noTokenClient.getRequest(
        ListApi.geocodingGetLocationByCityName(registerParams),
      );
      final dynamic data = response.data;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = placeLocationFromJson(data);

        return result;
      } else {
        throw const ServerException(arrayMessage: ['status code != 200']);
      }
    } on ServerException {
      rethrow;
    }
  }
}
