// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HazardEventImpl _$$HazardEventImplFromJson(Map<String, dynamic> json) =>
    _$HazardEventImpl(
      id: json['id'] as String,
      type: $enumDecode(_$HazardTypeEnumMap, json['type']),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      title: json['title'] as String?,
      countryCode: json['countryCode'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$HazardEventImplToJson(_$HazardEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$HazardTypeEnumMap[instance.type]!,
      'lat': instance.lat,
      'lng': instance.lng,
      'title': instance.title,
      'countryCode': instance.countryCode,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$HazardTypeEnumMap = {
  HazardType.fixedRadar: 'fixedRadar',
  HazardType.mobileRadar: 'mobileRadar',
  HazardType.police: 'police',
  HazardType.danger: 'danger',
};
