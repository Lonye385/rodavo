import '../../domain/entities/route_request.dart';
import '../../domain/entities/route_result.dart';

/// Stub datasource. Real HERE integration (SDK/REST) will plug in here.
abstract interface class HereRoutingDataSource {
  Future<RouteResult> calculate(RouteRequest request);
}

class HereRoutingDataSourceStub implements HereRoutingDataSource {
  @override
  Future<RouteResult> calculate(RouteRequest request) async {
    // TODO: Replace with HERE Truck Routing (Level 1) call.
    // This stub produces a deterministic "fake" route, useful for wiring & caching.
    final id = 'stub_${request.waypoints.join('_').hashCode}';

    return RouteResult(
      routeId: id,
      polyline: 'polyline_stub',
      maneuvers: request.waypoints.map((w) => 'Via $w').toList(growable: false),
      distanceMeters: request.waypoints.length * 10000,
      durationSeconds: request.waypoints.length * 900,
      computedAt: DateTime.now().toUtc(),
    );
  }
}
