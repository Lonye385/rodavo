import 'dart:math';

class TokenBucket {
  TokenBucket({
    required this.capacity,
    required this.refillTokensPerSecond,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now {
    _tokens = capacity.toDouble();
    _lastRefill = _now().toUtc();
  }

  final int capacity;
  final double refillTokensPerSecond;
  final DateTime Function() _now;

  late double _tokens;
  late DateTime _lastRefill;

  bool tryConsume(int tokens) {
    if (tokens <= 0) return true;

    _refill();
    if (_tokens >= tokens) {
      _tokens -= tokens;
      return true;
    }
    return false;
  }

  Duration timeUntilAvailable(int tokens) {
    if (tokens <= 0) return Duration.zero;

    _refill();
    if (_tokens >= tokens) return Duration.zero;

    final missing = tokens - _tokens;
    final seconds = missing / max(0.0001, refillTokensPerSecond);
    return Duration(milliseconds: (seconds * 1000).ceil());
  }

  void _refill() {
    final now = _now().toUtc();
    final elapsed = now.difference(_lastRefill).inMilliseconds / 1000.0;
    if (elapsed <= 0) return;

    _tokens = min(capacity.toDouble(), _tokens + elapsed * refillTokensPerSecond);
    _lastRefill = now;
  }
}
