import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/core_providers.dart';
import '../../../../core/usage/usage_providers.dart';
import '../../data/datasources/here_routing_datasource.dart';
import '../../data/repositories/routing_repository_cached_impl.dart';
import '../../domain/repositories/routing_repository.dart';

final hereRoutingDataSourceProvider = Provider<HereRoutingDataSource>((ref) {
  // Swap to real datasource when HERE SDK/REST is integrated.
  return HereRoutingDataSourceStub();
});

final routingRepositoryProvider = Provider<RoutingRepository>((ref) {
  return RoutingRepositoryCachedImpl(
    remote: ref.watch(hereRoutingDataSourceProvider),
    cache: ref.watch(routingCacheStoreProvider),
    limiter: ref.watch(hereRoutingRateLimiterProvider),
    usage: ref.watch(usageMeterProvider),
  );
});
