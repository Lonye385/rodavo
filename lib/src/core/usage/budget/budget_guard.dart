import '../usage_event_type.dart';
import '../usage_meter.dart';
import 'plan_policy.dart';

class BudgetGuard {
  BudgetGuard({required UsageMeter meter, required PlanPolicy policy})
      : _meter = meter,
        _policy = policy;

  final UsageMeter _meter;
  final PlanPolicy _policy;

  Future<void> assertAllowed(UsageEventType type, {int cost = 1}) async {
    final caps = _policy.monthlyCaps();
    final cap = caps[type];
    if (cap == null) return; // not capped

    final counts = await _meter.getLastNDaysCounts(30);
    final used = counts[type] ?? 0;

    if (used + cost > cap) {
      throw BudgetExceededException(type: type, used: used, cap: cap);
    }
  }

  Future<bool> shouldEnableLiteMode() async {
    final caps = _policy.monthlyCaps();
    final counts = await _meter.getLastNDaysCounts(30);
    final t = _policy.softThreshold();

    for (final e in caps.entries) {
      final used = counts[e.key] ?? 0;
      if (e.value > 0 && used / e.value >= t) return true;
    }
    return false;
  }
}

class BudgetExceededException implements Exception {
  BudgetExceededException({required this.type, required this.used, required this.cap});

  final UsageEventType type;
  final int used;
  final int cap;

  @override
  String toString() => 'BudgetExceededException(type: ${type.name}, used: $used, cap: $cap)';
}
