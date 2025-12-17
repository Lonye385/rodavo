import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../persistence/hive_init.dart';
import 'usage_event_type.dart';

/// Simple on-device counter store, per calendar day.
///
/// Key format: yyyy-mm-dd
/// Value JSON: {"vectorTile": 123, ...}
class UsageMeter {
  UsageMeter() : _box = Hive.box<String>(usageBoxName);

  final Box<String> _box;

  Future<void> increment(UsageEventType type, {int by = 1, DateTime? at}) async {
    if (by <= 0) return;

    final now = (at ?? DateTime.now()).toUtc();
    final dayKey = _dayKey(now);

    final raw = _box.get(dayKey);
    final map = <String, int>{};

    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is Map) {
          for (final e in decoded.entries) {
            final k = e.key.toString();
            final v = e.value;
            if (v is int) map[k] = v;
          }
        }
      } catch (_) {
        // ignore corrupted day
      }
    }

    final k = type.name;
    map[k] = (map[k] ?? 0) + by;

    await _box.put(dayKey, jsonEncode(map));
  }

  Future<Map<UsageEventType, int>> getLastNDaysCounts(int days, {DateTime? now}) async {
    final out = <UsageEventType, int>{};
    final base = (now ?? DateTime.now()).toUtc();

    for (var i = 0; i < days; i++) {
      final day = base.subtract(Duration(days: i));
      final raw = _box.get(_dayKey(day));
      if (raw == null || raw.isEmpty) continue;

      try {
        final decoded = jsonDecode(raw);
        if (decoded is! Map) continue;
        for (final entry in decoded.entries) {
          final type = UsageEventType.values.where((t) => t.name == entry.key).firstOrNull;
          if (type == null) continue;
          final v = entry.value;
          if (v is int) out[type] = (out[type] ?? 0) + v;
        }
      } catch (_) {
        // ignore
      }
    }

    return out;
  }

  Future<void> clearAll() => _box.clear();

  String _dayKey(DateTime utc) {
    final y = utc.year.toString().padLeft(4, '0');
    final m = utc.month.toString().padLeft(2, '0');
    final d = utc.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}

extension _FirstOrNullExt<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
