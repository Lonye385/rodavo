// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CacheEntryImpl _$$CacheEntryImplFromJson(Map<String, dynamic> json) =>
    _$CacheEntryImpl(
      key: json['key'] as String,
      payloadJson: json['payloadJson'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      hitCount: (json['hitCount'] as num?)?.toInt() ?? 0,
      lastAccessAt: json['lastAccessAt'] == null
          ? null
          : DateTime.parse(json['lastAccessAt'] as String),
    );

Map<String, dynamic> _$$CacheEntryImplToJson(_$CacheEntryImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'payloadJson': instance.payloadJson,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'hitCount': instance.hitCount,
      'lastAccessAt': instance.lastAccessAt?.toIso8601String(),
    };
