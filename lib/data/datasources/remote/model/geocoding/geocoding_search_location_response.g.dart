// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_search_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingSearchLocationListResponse
    _$GeocodingSearchLocationListResponseFromJson(Map<String, dynamic> json) =>
        GeocodingSearchLocationListResponse(
          results: (json['results'] as List<dynamic>?)
              ?.map((e) => GeocodingSearchLocationListItemResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          generationtimeMs: (json['generationtimeMs'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GeocodingSearchLocationListResponseToJson(
        GeocodingSearchLocationListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'generationtimeMs': instance.generationtimeMs,
    };

GeocodingSearchLocationListItemResponse
    _$GeocodingSearchLocationListItemResponseFromJson(
            Map<String, dynamic> json) =>
        GeocodingSearchLocationListItemResponse(
          id: json['id'] as int?,
          name: json['name'] as String?,
          latitude: (json['latitude'] as num?)?.toDouble(),
          longitude: (json['longitude'] as num?)?.toDouble(),
          elevation: (json['elevation'] as num?)?.toDouble(),
          featureCode: json['featureCode'] as String?,
          countryCode: json['countryCode'] as String?,
          admin1Id: json['admin1Id'] as int?,
          admin2Id: json['admin2Id'] as int?,
          timezone: json['timezone'] as String?,
          population: json['population'] as int?,
          countryId: json['countryId'] as int?,
          country: json['country'] as String?,
          admin1: json['admin1'] as String?,
          admin2: json['admin2'] as String?,
        );

Map<String, dynamic> _$GeocodingSearchLocationListItemResponseToJson(
        GeocodingSearchLocationListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'featureCode': instance.featureCode,
      'countryCode': instance.countryCode,
      'admin1Id': instance.admin1Id,
      'admin2Id': instance.admin2Id,
      'timezone': instance.timezone,
      'population': instance.population,
      'countryId': instance.countryId,
      'country': instance.country,
      'admin1': instance.admin1,
      'admin2': instance.admin2,
    };
