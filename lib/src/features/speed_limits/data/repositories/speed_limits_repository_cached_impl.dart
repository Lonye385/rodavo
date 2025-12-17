import 'dart:convert';

import '../../../../core/cache/cache_store.dart';
import '../../../../core/rate_limit/rate_limiter.dart';
import '../../../../core/usage/budget/budget_guard.dart';
import '../../../../core/usage/usage_event_type.dart';
import '../../../../core/usage/usage_meter.dart';
import '../../domain/entities/speed_limit_result.dart';
import '../../domain/repositories/speed_limits_repository.dart';
import '../datasources/here_speed_limits_datasource.dart';

class SpeedLimitsRepositoryCachedImpl implements SpeedLimitsRepository {
  SpeedLimitsRepositoryCachedImpl({
    required HereSpeedLimitsDataSource remote,
    required CacheStore cache,
    required RateLimiter limiter,
    required UsageMeter usage,
    required BudgetGuard budget,
  })  : _remote = remote,
        _cache = cache,
        _limiter = limiter,
        _usage = usage,
        _budget = budget;

  final HereSpeedLimitsDataSource _remote;
  final CacheStore _cache;
  final RateLimiter _limiter;
  final UsageMeter _usage;
  final BudgetGuard _budget;

  static const _ttl = Duration(hours: 12);

  @override
  Future<SpeedLimitResult?> getSpeedLimit({required double lat, required double lng, String? countryCode}) async {
    final key = _cacheKey(lat, lng, countryCode);
    final cached = await _cache.get(key);
    if (cached != null) {
      final decoded = jsonDecode(cached);
      return SpeedLimitResult.fromJson((decoded as Map).cast<String, dynamic>());
    }

    await _budget.assertAllowed(UsageEventType.speedLimits, cost: 1);
    _limiter.check(cost: 1);
    await _usage.increment(UsageEventType.speedLimits);

    final res = await _remote.fetch(lat: lat, lng: lng, countryCode: countryCode);
    if (res == null) return null;

    await _cache.put(key, jsonEncode(res.toJson()), ttl: _ttl);
    return res;
  }

  String _cacheKey(double lat, double lng, String? countryCode) {
    // Grid to reduce cardinality; speed limits are road-segment based.
    final glat = (lat * 1000).round();
    final glng = (lng * 1000).round();
    return 'speed_${[glat, glng, countryCode].toString().hashCode}';
  }
}
