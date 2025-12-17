import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'cache_entry.dart';
import 'cache_store.dart';

class HiveCacheStore implements CacheStore {
  HiveCacheStore(this._box);

  final Box<String> _box;

  @override
  Future<void> clear() async => _box.clear();

  @override
  Future<void> delete(String key) async => _box.delete(key);

  @override
  Future<String?> get(String key) async {
    final raw = _box.get(key);
    if (raw == null || raw.isEmpty) return null;

    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) return null;

    final entry = CacheEntry.fromJson(decoded);
    final now = DateTime.now().toUtc();

    if (entry.expiresAt != null && entry.expiresAt!.isBefore(now)) {
      await _box.delete(key);
      return null;
    }

    // Best-effort: update stats without blocking.
    final updated = entry.copyWith(
      hitCount: entry.hitCount + 1,
      lastAccessAt: now,
    );
    // ignore: discarded_futures
    _box.put(key, jsonEncode(updated.toJson()));

    return entry.payloadJson;
  }

  @override
  Future<void> put(String key, String payloadJson, {Duration? ttl}) async {
    final now = DateTime.now().toUtc();
    final expiresAt = ttl == null ? null : now.add(ttl);

    final entry = CacheEntry(
      key: key,
      payloadJson: payloadJson,
      createdAt: now,
      expiresAt: expiresAt,
      hitCount: 0,
      lastAccessAt: now,
    );

    await _box.put(key, jsonEncode(entry.toJson()));
  }
}
