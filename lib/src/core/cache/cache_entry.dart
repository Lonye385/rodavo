import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_entry.freezed.dart';
part 'cache_entry.g.dart';

@freezed
class CacheEntry with _$CacheEntry {
  const factory CacheEntry({
    required String key,
    required String payloadJson,
    required DateTime createdAt,
    DateTime? expiresAt,
    @Default(0) int hitCount,
    DateTime? lastAccessAt,
  }) = _CacheEntry;

  factory CacheEntry.fromJson(Map<String, dynamic> json) => _$CacheEntryFromJson(json);
}
