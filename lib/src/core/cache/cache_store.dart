abstract interface class CacheStore {
  Future<String?> get(String key);
  Future<void> put(String key, String payloadJson, {Duration? ttl});
  Future<void> delete(String key);
  Future<void> clear();
}
