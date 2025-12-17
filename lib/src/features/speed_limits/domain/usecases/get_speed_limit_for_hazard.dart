import '../../../hazards/domain/entities/hazard_event.dart';
import '../entities/speed_limit_result.dart';
import '../repositories/speed_limits_repository.dart';

class GetSpeedLimitForHazard {
  const GetSpeedLimitForHazard(this._repo);

  final SpeedLimitsRepository _repo;

  /// Only call this when a hazard is triggered (e.g., within 1 km).
  Future<SpeedLimitResult?> call({required HazardEvent hazard}) {
    return _repo.getSpeedLimit(lat: hazard.lat, lng: hazard.lng, countryCode: hazard.countryCode);
  }
}
