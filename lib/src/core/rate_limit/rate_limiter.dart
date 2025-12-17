import 'token_bucket.dart';

class RateLimiter {
  RateLimiter(this._bucket);

  final TokenBucket _bucket;

  /// Throws [RateLimitedException] if the call should be blocked.
  void check({int cost = 1}) {
    final ok = _bucket.tryConsume(cost);
    if (!ok) {
      throw RateLimitedException(_bucket.timeUntilAvailable(cost));
    }
  }
}

class RateLimitedException implements Exception {
  RateLimitedException(this.retryAfter);

  final Duration retryAfter;

  @override
  String toString() => 'RateLimitedException(retryAfter: $retryAfter)';
}
