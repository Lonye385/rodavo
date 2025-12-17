// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteOptionsImpl _$$RouteOptionsImplFromJson(Map<String, dynamic> json) =>
    _$RouteOptionsImpl(
      avoidTolls: json['avoidTolls'] as bool? ?? false,
      avoidFerries: json['avoidFerries'] as bool? ?? false,
      preferTruckRouting: json['preferTruckRouting'] as bool? ?? false,
      includeTraffic: json['includeTraffic'] as bool? ?? false,
    );

Map<String, dynamic> _$$RouteOptionsImplToJson(_$RouteOptionsImpl instance) =>
    <String, dynamic>{
      'avoidTolls': instance.avoidTolls,
      'avoidFerries': instance.avoidFerries,
      'preferTruckRouting': instance.preferTruckRouting,
      'includeTraffic': instance.includeTraffic,
    };
