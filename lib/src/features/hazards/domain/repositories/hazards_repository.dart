import '../entities/hazard_event.dart';

abstract interface class HazardsRepository {
  Future<List<HazardEvent>> getAllActive();
  Future<void> upsertMany(List<HazardEvent> events);
  Future<void> clear();

  /// Pure on-device query: returns hazards within radiusMeters from current position.
  Future<List<HazardEvent>> nearby({required double lat, required double lng, required int radiusMeters});
}
