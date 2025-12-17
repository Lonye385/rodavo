// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceSuggestionImpl _$$PlaceSuggestionImplFromJson(
  Map<String, dynamic> json,
) => _$PlaceSuggestionImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$PlaceSuggestionImplToJson(
  _$PlaceSuggestionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'lat': instance.lat,
  'lng': instance.lng,
};
