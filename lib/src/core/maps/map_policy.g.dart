// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapPolicyImpl _$$MapPolicyImplFromJson(
  Map<String, dynamic> json,
) => _$MapPolicyImpl(
  trafficEnabled: json['trafficEnabled'] as bool,
  allowPanZoom: json['allowPanZoom'] as bool,
  cameraUpdateInterval: Duration(
    microseconds: (json['cameraUpdateInterval'] as num).toInt(),
  ),
  trafficRefreshInterval: Duration(
    microseconds: (json['trafficRefreshInterval'] as num).toInt(),
  ),
  lowSpecRendering: json['lowSpecRendering'] as bool,
  maxVectorTilesPer30Days: (json['maxVectorTilesPer30Days'] as num?)?.toInt(),
  maxTrafficTilesPer30Days: (json['maxTrafficTilesPer30Days'] as num?)?.toInt(),
);

Map<String, dynamic> _$$MapPolicyImplToJson(_$MapPolicyImpl instance) =>
    <String, dynamic>{
      'trafficEnabled': instance.trafficEnabled,
      'allowPanZoom': instance.allowPanZoom,
      'cameraUpdateInterval': instance.cameraUpdateInterval.inMicroseconds,
      'trafficRefreshInterval': instance.trafficRefreshInterval.inMicroseconds,
      'lowSpecRendering': instance.lowSpecRendering,
      'maxVectorTilesPer30Days': instance.maxVectorTilesPer30Days,
      'maxTrafficTilesPer30Days': instance.maxTrafficTilesPer30Days,
    };
