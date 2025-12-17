import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../cache/cache_store.dart';
import '../cache/hive_cache_store.dart';
import '../persistence/hive_init.dart';
import '../rate_limit/rate_limiter.dart';
import '../rate_limit/token_bucket.dart';

/// Shared rate limiter for HERE-like network calls (configurable per endpoint).
final hereRoutingRateLimiterProvider = Provider<RateLimiter>((ref) {
  // Example: allow bursts of 3 route calls, then ~1 per 30s.
  return RateLimiter(TokenBucket(capacity: 3, refillTokensPerSecond: 1 / 30.0));
});

final hereSearchRateLimiterProvider = Provider<RateLimiter>((ref) {
  // Example: allow bursts of 10, then ~1 per 2s.
  return RateLimiter(TokenBucket(capacity: 10, refillTokensPerSecond: 0.5));
});

final routingCacheStoreProvider = Provider<CacheStore>((ref) {
  final box = Hive.box<String>(routingCacheBoxName);
  return HiveCacheStore(box);
});

final searchCacheStoreProvider = Provider<CacheStore>((ref) {
  final box = Hive.box<String>(searchCacheBoxName);
  return HiveCacheStore(box);
});
