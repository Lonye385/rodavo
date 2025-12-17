import '../entities/route_request.dart';
import '../entities/route_result.dart';

abstract interface class RoutingRepository {
  /// Cache-first: returns cached route when valid; otherwise calculates and stores.
  Future<RouteResult> getRoute(RouteRequest request);

  /// Forces recalculation (e.g., after confirmed off-route > 500m).
  Future<RouteResult> recalcRoute(RouteRequest request);
}
