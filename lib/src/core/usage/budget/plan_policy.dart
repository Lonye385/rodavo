import '../usage_event_type.dart';
import 'plan_tier.dart';

class PlanPolicy {
  const PlanPolicy(this.tier);

  final PlanTier tier;

  /// Hard caps per 30 days, per event type.
  /// These are *business safety rails* to guarantee margin.
  Map<UsageEventType, int> monthlyCaps() {
    switch (tier) {
      case PlanTier.basic490:
        return const {
          UsageEventType.carRouting: 1200,
          UsageEventType.autosuggest: 1200,
          UsageEventType.discoverSearch: 300,
          UsageEventType.geocoding: 400,
          UsageEventType.speedLimits: 600,
          // Tiles will be enforced once map integration exists.
          UsageEventType.vectorTile: 25000,
          UsageEventType.trafficVectorTile: 0,
        };
      case PlanTier.pro1490:
        return const {
          UsageEventType.carRouting: 4000,
          UsageEventType.truckRouting: 800,
          UsageEventType.autosuggest: 6000,
          UsageEventType.discoverSearch: 1500,
          UsageEventType.geocoding: 2500,
          UsageEventType.speedLimits: 3000,
          UsageEventType.vectorTile: 150000,
          UsageEventType.trafficVectorTile: 20000,
        };
    }
  }

  /// Soft threshold to start "Navigation Lite" before the hard stop.
  double softThreshold() {
    return tier == PlanTier.basic490 ? 0.8 : 0.85;
  }
}
