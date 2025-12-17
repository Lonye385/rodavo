// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_limit_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpeedLimitResultImpl _$$SpeedLimitResultImplFromJson(
  Map<String, dynamic> json,
) => _$SpeedLimitResultImpl(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  maxKph: (json['maxKph'] as num?)?.toInt(),
  source: json['source'] as String?,
  fetchedAt: json['fetchedAt'] == null
      ? null
      : DateTime.parse(json['fetchedAt'] as String),
);

Map<String, dynamic> _$$SpeedLimitResultImplToJson(
  _$SpeedLimitResultImpl instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'maxKph': instance.maxKph,
  'source': instance.source,
  'fetchedAt': instance.fetchedAt?.toIso8601String(),
};
