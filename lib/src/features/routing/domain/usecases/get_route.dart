import '../entities/route_request.dart';
import '../entities/route_result.dart';
import '../repositories/routing_repository.dart';

class GetRoute {
  const GetRoute(this._repo);

  final RoutingRepository _repo;

  Future<RouteResult> call(RouteRequest request) => _repo.getRoute(request);
}
