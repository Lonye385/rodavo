import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/core_providers.dart';
import '../../../../core/usage/usage_providers.dart';
import '../../../../core/usage/budget/budget_providers.dart';
import '../../data/datasources/here_place_search_datasource.dart';
import '../../data/repositories/place_search_repository_cached_impl.dart';
import '../../domain/repositories/place_search_repository.dart';

final herePlaceSearchDataSourceProvider = Provider<HerePlaceSearchDataSource>((ref) {
  return HerePlaceSearchDataSourceStub();
});

final placeSearchRepositoryProvider = Provider<PlaceSearchRepository>((ref) {
  return PlaceSearchRepositoryCachedImpl(
    remote: ref.watch(herePlaceSearchDataSourceProvider),
    cache: ref.watch(searchCacheStoreProvider),
    limiter: ref.watch(hereSearchRateLimiterProvider),
    usage: ref.watch(usageMeterProvider),
    budget: ref.watch(budgetGuardProvider),
  );
});
