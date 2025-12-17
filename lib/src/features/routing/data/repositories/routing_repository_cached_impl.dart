import 'dart:convert';

import '../../../../core/cache/cache_store.dart';
import '../../../../core/rate_limit/rate_limiter.dart';
import '../../domain/entities/route_request.dart';
import '../../domain/entities/route_result.dart';
import '../../domain/repositories/routing_repository.dart';
import '../datasources/here_routing_datasource.dart';

class RoutingRepositoryCachedImpl implements RoutingRepository {
  RoutingRepositoryCachedImpl({
    required HereRoutingDataSource remote,
    required CacheStore cache,
    required RateLimiter limiter,
  })  : _remote = remote,
        _cache = cache,
        _limiter = limiter;

  final HereRoutingDataSource _remote;
  final CacheStore _cache;
  final RateLimiter _limiter;

  static const _ttl = Duration(hours: 24);

  @override
  Future<RouteResult> getRoute(RouteRequest request) async {
    final key = _cacheKey(request);
    final cached = await _cache.get(key);
    if (cached != null) {
      final map = jsonDecode(cached);
      return RouteResult.fromJson((map as Map).cast<String, dynamic>());
    }

    return _calculateAndCache(request, key: key);
  }

  @override
  Future<RouteResult> recalcRoute(RouteRequest request) async {
    final key = _cacheKey(request, force: true);
    return _calculateAndCache(request, key: key);
  }

  Future<RouteResult> _calculateAndCache(RouteRequest request, {required String key}) async {
    // One "token" per route calc; you can increase cost depending on chosen HERE endpoint.
    _limiter.check(cost: 1);

    final route = await _remote.calculate(request);
    await _cache.put(key, jsonEncode(route.toJson()), ttl: _ttl);
    return route;
  }

  String _cacheKey(RouteRequest request, {bool force = false}) {
    // Deterministic key: vehicle+waypoints+options+locale.
    // NOTE: keep this stable to maximize cache hits.
    final base = <Object?>[
      request.vehicle.vehicleGroup.name,
      request.vehicle.vehicleType.name,
      request.waypoints,
      request.options.toJson(),
      request.locale,
    ].toString();

    return force ? 'route_force_${base.hashCode}' : 'route_${base.hashCode}';
  }
}
