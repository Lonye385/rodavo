// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleProfileImpl _$$VehicleProfileImplFromJson(Map<String, dynamic> json) =>
    _$VehicleProfileImpl(
      vehicleGroup: $enumDecode(_$VehicleGroupEnumMap, json['vehicleGroup']),
      vehicleType: $enumDecode(_$VehicleTypeEnumMap, json['vehicleType']),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      vehicleDisplayName: json['vehicleDisplayName'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VehicleProfileImplToJson(
  _$VehicleProfileImpl instance,
) => <String, dynamic>{
  'vehicleGroup': _$VehicleGroupEnumMap[instance.vehicleGroup]!,
  'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
  'waypoints': instance.waypoints,
  'vehicleDisplayName': instance.vehicleDisplayName,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$VehicleGroupEnumMap = {
  VehicleGroup.groupA: 'groupA',
  VehicleGroup.groupB: 'groupB',
};

const _$VehicleTypeEnumMap = {
  VehicleType.truck: 'truck',
  VehicleType.bus: 'bus',
  VehicleType.rv: 'rv',
  VehicleType.car: 'car',
  VehicleType.moto: 'moto',
};
