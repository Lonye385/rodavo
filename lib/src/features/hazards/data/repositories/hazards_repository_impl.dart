import 'dart:math';

import '../../domain/entities/hazard_event.dart';
import '../../domain/repositories/hazards_repository.dart';
import '../datasources/hazards_local_datasource.dart';

class HazardsRepositoryImpl implements HazardsRepository {
  HazardsRepositoryImpl(this._local);

  final HazardsLocalDataSource _local;

  @override
  Future<void> clear() => _local.clear();

  @override
  Future<List<HazardEvent>> getAllActive() async {
    final all = await _local.getAll();
    return all.where((e) => e.isActive).toList(growable: false);
  }

  @override
  Future<List<HazardEvent>> nearby({required double lat, required double lng, required int radiusMeters}) async {
    final all = await getAllActive();
    return all
        .where(
          (e) => _haversineMeters(lat, lng, e.lat, e.lng) <= radiusMeters,
        )
        .toList(growable: false);
  }

  @override
  Future<void> upsertMany(List<HazardEvent> events) => _local.upsertMany(events);
}

int _haversineMeters(double lat1, double lon1, double lat2, double lon2) {
  const r = 6371000.0; // meters
  final dLat = _degToRad(lat2 - lat1);
  final dLon = _degToRad(lon2 - lon1);
  final a =
      pow(sin(dLat / 2), 2) + cos(_degToRad(lat1)) * cos(_degToRad(lat2)) * pow(sin(dLon / 2), 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return (r * c).round();
}

double _degToRad(double d) => d * (pi / 180.0);
