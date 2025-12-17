import '../entities/speed_limit_result.dart';

abstract interface class SpeedLimitsRepository {
  /// Cache-first lookup for a point (used only when a hazard alert is triggered).
  Future<SpeedLimitResult?> getSpeedLimit({required double lat, required double lng, String? countryCode});
}
