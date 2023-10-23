import 'package:json_annotation/json_annotation.dart';

part 'geocoding_search_location_response.g.dart';

@JsonSerializable()
class GeocodingSearchLocationResonse {
  List<GeocodingSearchLocationListItemResponse>? results;
  double? generationtimeMs;

  GeocodingSearchLocationResonse({this.results, this.generationtimeMs});

  GeocodingSearchLocationResonse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingSearchLocationResonseFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingSearchLocationResonseToJson(this);
}

@JsonSerializable()
class GeocodingSearchLocationListItemResponse {
  int? id;
  String? name;
  // @JsonKey(name: 'lat') // If the name option is 'lat' in the API data
  double? latitude;
  double? longitude;
  int? elevation;
  String? featureCode;
  String? countryCode;
  int? admin1Id;
  int? admin2Id;
  String? timezone;
  int? population;
  int? countryId;
  String? country;
  String? admin1;
  String? admin2;

  GeocodingSearchLocationListItemResponse({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.admin2Id,
    this.timezone,
    this.population,
    this.countryId,
    this.country,
    this.admin1,
    this.admin2,
  });

  GeocodingSearchLocationListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingSearchLocationListItemResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GeocodingSearchLocationListItemResponseToJson(this);
}
