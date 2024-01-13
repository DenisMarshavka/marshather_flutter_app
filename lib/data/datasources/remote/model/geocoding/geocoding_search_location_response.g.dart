// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_search_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingSearchLocationResponse _$GeocodingSearchLocationResponseFromJson(
        Map<String, dynamic> json) =>
    GeocodingSearchLocationResponse(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      poweredBy: json['powered_by'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osm_id'] as int?,
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      displayName: json['display_name'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GeocodingSearchLocationResponseToJson(
        GeocodingSearchLocationResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'powered_by': instance.poweredBy,
      'osm_type': instance.osmType,
      'osm_id': instance.osmId,
      'boundingbox': instance.boundingbox,
      'lat': instance.lat,
      'lon': instance.lon,
      'display_name': instance.displayName,
      'type': instance.type,
      'importance': instance.importance,
    };
