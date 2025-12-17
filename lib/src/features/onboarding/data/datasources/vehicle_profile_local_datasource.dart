import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/persistence/hive_init.dart';
import '../../domain/entities/vehicle_profile.dart';

class VehicleProfileLocalDataSource {
  static const _key = 'vehicle_profile_v1';

  Box<String> get _box => Hive.box<String>(vehicleProfileBoxName);

  Future<VehicleProfile?> read() async {
    final raw = _box.get(_key);
    if (raw == null || raw.isEmpty) return null;

    final map = jsonDecode(raw);
    if (map is! Map<String, dynamic>) return null;

    return VehicleProfile.fromJson(map);
  }

  Future<void> write(VehicleProfile profile) async {
    final now = DateTime.now().toUtc();
    final toSave = profile.copyWith(
      createdAt: profile.createdAt ?? now,
      updatedAt: now,
    );

    final json = jsonEncode(toSave.toJson());
    await _box.put(_key, json);
  }

  Future<void> clear() async {
    await _box.delete(_key);
  }
}
