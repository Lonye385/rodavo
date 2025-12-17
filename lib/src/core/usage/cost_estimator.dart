import 'here_cpm.dart';
import 'usage_event_type.dart';

class CostEstimator {
  const CostEstimator();

  double estimateEur(Map<UsageEventType, int> counts) {
    var total = 0.0;
    for (final e in counts.entries) {
      final cpm = hereCpmEur[e.key];
      if (cpm == null) continue;
      total += (e.value / 1000.0) * cpm;
    }
    return total;
  }
}
