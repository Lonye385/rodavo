import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/persistence/hive_init.dart';
import '../../domain/entities/hazard_event.dart';

class HazardsLocalDataSource {
  Box<String> get _box => Hive.box<String>(hazardsBoxName);

  Future<List<HazardEvent>> getAll() async {
    final out = <HazardEvent>[];
    for (final v in _box.values) {
      try {
        final decoded = jsonDecode(v);
        if (decoded is! Map<String, dynamic>) continue;
        out.add(HazardEvent.fromJson(decoded));
      } catch (_) {
        // ignore corrupted entries
      }
    }
    return out;
  }

  Future<void> upsertMany(List<HazardEvent> events) async {
    final now = DateTime.now().toUtc();
    final map = <String, String>{};

    for (final e in events) {
      final updated = e.copyWith(updatedAt: now, createdAt: e.createdAt ?? now);
      map[updated.id] = jsonEncode(updated.toJson());
    }

    await _box.putAll(map);
  }

  Future<void> clear() async => _box.clear();
}
