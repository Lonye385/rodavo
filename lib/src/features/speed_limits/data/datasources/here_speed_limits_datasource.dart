import '../../domain/entities/speed_limit_result.dart';

abstract interface class HereSpeedLimitsDataSource {
  Future<SpeedLimitResult?> fetch({required double lat, required double lng, String? countryCode});
}

/// Stub (no real HERE call yet).
class HereSpeedLimitsDataSourceStub implements HereSpeedLimitsDataSource {
  @override
  Future<SpeedLimitResult?> fetch({required double lat, required double lng, String? countryCode}) async {
    // TODO: integrate HERE Speed Limits endpoint.
    return SpeedLimitResult(
      lat: lat,
      lng: lng,
      maxKph: null,
      source: 'stub',
      fetchedAt: DateTime.now().toUtc(),
    );
  }
}
