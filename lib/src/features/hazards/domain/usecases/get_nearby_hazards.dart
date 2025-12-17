import '../entities/hazard_event.dart';
import '../repositories/hazards_repository.dart';

class GetNearbyHazards {
  const GetNearbyHazards(this._repo);

  final HazardsRepository _repo;

  Future<List<HazardEvent>> call({required double lat, required double lng, required int radiusMeters}) {
    return _repo.nearby(lat: lat, lng: lng, radiusMeters: radiusMeters);
  }
}
