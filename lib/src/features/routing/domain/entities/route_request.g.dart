// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteRequestImpl _$$RouteRequestImplFromJson(Map<String, dynamic> json) =>
    _$RouteRequestImpl(
      vehicle: VehicleProfile.fromJson(json['vehicle'] as Map<String, dynamic>),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      options: json['options'] == null
          ? const RouteOptions()
          : RouteOptions.fromJson(json['options'] as Map<String, dynamic>),
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$$RouteRequestImplToJson(_$RouteRequestImpl instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'waypoints': instance.waypoints,
      'options': instance.options,
      'locale': instance.locale,
    };
