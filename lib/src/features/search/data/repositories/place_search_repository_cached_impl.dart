import 'dart:convert';

import '../../../../core/cache/cache_store.dart';
import '../../../../core/rate_limit/rate_limiter.dart';
import '../../domain/entities/place_suggestion.dart';
import '../../domain/repositories/place_search_repository.dart';
import '../datasources/here_place_search_datasource.dart';

class PlaceSearchRepositoryCachedImpl implements PlaceSearchRepository {
  PlaceSearchRepositoryCachedImpl({
    required HerePlaceSearchDataSource remote,
    required CacheStore cache,
    required RateLimiter limiter,
  })  : _remote = remote,
        _cache = cache,
        _limiter = limiter;

  final HerePlaceSearchDataSource _remote;
  final CacheStore _cache;
  final RateLimiter _limiter;

  static const _ttl = Duration(days: 7);

  @override
  Future<List<PlaceSuggestion>> suggest({required String query, String? locale}) async {
    final cleaned = query.trim();
    if (cleaned.isEmpty) return const [];

    final key = _cacheKey(cleaned, locale);
    final cached = await _cache.get(key);
    if (cached != null) {
      final decoded = jsonDecode(cached);
      final list = (decoded as List).cast<Map>();
      return list.map((m) => PlaceSuggestion.fromJson(m.cast<String, dynamic>())).toList(growable: false);
    }

    // Suggestions are high-volume: keep limiter permissive.
    _limiter.check(cost: 1);

    final res = await _remote.suggest(query: cleaned, locale: locale);
    await _cache.put(key, jsonEncode(res.map((e) => e.toJson()).toList(growable: false)), ttl: _ttl);
    return res;
  }

  String _cacheKey(String query, String? locale) {
    return 'suggest_${[query.toLowerCase(), locale].toString().hashCode}';
  }
}
