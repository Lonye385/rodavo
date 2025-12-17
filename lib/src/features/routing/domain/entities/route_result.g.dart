// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteResultImpl _$$RouteResultImplFromJson(Map<String, dynamic> json) =>
    _$RouteResultImpl(
      routeId: json['routeId'] as String,
      polyline: json['polyline'] as String,
      maneuvers:
          (json['maneuvers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      distanceMeters: (json['distanceMeters'] as num?)?.toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      computedAt: json['computedAt'] == null
          ? null
          : DateTime.parse(json['computedAt'] as String),
    );

Map<String, dynamic> _$$RouteResultImplToJson(_$RouteResultImpl instance) =>
    <String, dynamic>{
      'routeId': instance.routeId,
      'polyline': instance.polyline,
      'maneuvers': instance.maneuvers,
      'distanceMeters': instance.distanceMeters,
      'durationSeconds': instance.durationSeconds,
      'computedAt': instance.computedAt?.toIso8601String(),
    };
