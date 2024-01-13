import 'package:json_annotation/json_annotation.dart';

part 'geocoding_search_location_response.g.dart';

@JsonSerializable()
class GeocodingSearchLocationResponse {
  @JsonKey(name: 'place_id')
  int? placeId;
  String? licence;
  @JsonKey(name: 'powered_by')
  String? poweredBy;
  @JsonKey(name: 'osm_type')
  String? osmType;
  @JsonKey(name: 'osm_id')
  int? osmId;
  List<String>? boundingbox;
  String? lat;
  String? lon;
  @JsonKey(name: 'display_name')
  String? displayName;
  String? type;
  double? importance;

  GeocodingSearchLocationResponse({
    this.placeId,
    this.licence,
    this.poweredBy,
    this.osmType,
    this.osmId,
    this.boundingbox,
    this.lat,
    this.lon,
    this.displayName,
    this.type,
    this.importance,
  });

  factory GeocodingSearchLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingSearchLocationResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GeocodingSearchLocationResponseToJson(this);
}

List<GeocodingSearchLocationResponse> placeLocationFromJson(
    List<dynamic> data) {
  return List<GeocodingSearchLocationResponse>.from(
      data.map((x) => GeocodingSearchLocationResponse.fromJson(x)));
}
