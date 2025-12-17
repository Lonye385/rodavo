import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/core_providers.dart';
import '../../../../core/rate_limit/rate_limiter.dart';
import '../../../../core/rate_limit/token_bucket.dart';
import '../../../../core/usage/budget/budget_providers.dart';
import '../../../../core/usage/usage_providers.dart';
import '../../data/datasources/here_speed_limits_datasource.dart';
import '../../data/repositories/speed_limits_repository_cached_impl.dart';
import '../../domain/repositories/speed_limits_repository.dart';

final hereSpeedLimitsLimiterProvider = Provider<RateLimiter>((ref) {
  // Very low volume by design: hazards only.
  return RateLimiter(TokenBucket(capacity: 5, refillTokensPerSecond: 1 / 60.0));
});

final hereSpeedLimitsDataSourceProvider = Provider<HereSpeedLimitsDataSource>((ref) {
  return HereSpeedLimitsDataSourceStub();
});

final speedLimitsRepositoryProvider = Provider<SpeedLimitsRepository>((ref) {
  return SpeedLimitsRepositoryCachedImpl(
    remote: ref.watch(hereSpeedLimitsDataSourceProvider),
    cache: ref.watch(searchCacheStoreProvider),
    limiter: ref.watch(hereSpeedLimitsLimiterProvider),
    usage: ref.watch(usageMeterProvider),
    budget: ref.watch(budgetGuardProvider),
  );
});
